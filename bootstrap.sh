#!/bin/bash
# Script to config proxy and bootstrap ansible
# TODO: improve error handling etc.

# set -x

# Color decorations
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

_error() {
  echo -e "${RED}ERROR - $1${NC}"
  echo -e "${RED}Exiting...${NC}"
  sleep 2
}

_info() {
  ehco -e "${BLUE}$1${NC}"
}

_warn() {
  echo -e "${YELLOW}WARN - $1${NC}"
}

_success() {
  echo -e "${GREEN}$1${NC}"
}

clear

echo -e "This script will bootstrap all the installations of dotfiles as well as applications for your machine."
_warn "This script only runs on macOS & Fedora Linux."

if [[ -n "$GITHUB_ACTIONS" ]]; then
  echo -e "Skipping prompt in GitHub Actions workflow."
else
  read -rsn 1 -p "Press Enter to continue..."
fi

# Operation system check

OS=$(uname -s)

if [[ "$OS" != "Darwin" && "$OS" != "Linux" ]]; then
  _error "Unsupported platform. Only MacOS and Fedora Linux are supported."
  exit 1
elif [[ "$OS" == "Linux" ]]; then
  if [ ! -f /etc/fedora-release ]; then
    _error "Only Fedora Linux is supported."
    exit 1
  fi
fi

#################################################

_info "STEP 1. Proxy Setup"

# Prompt for proxy details or use environment variables
if [[ -z "${NAIVE_USERNAME}" ]]; then
  read -rps "Enter your username for Naiveproxy: " NAIVE_USERNAME
fi

if [[ -z "${NAIVE_PASSWORD}" ]]; then
  read -rps "Enter your password for Naiveproxy: " NAIVE_PASSWORD
fi

if [[ -z "${NAIVE_DOMAIN}" ]]; then
  read -rps "Enter your domain address for Naiveproxy: " NAIVE_DOMAIN
fi

if [[ -z "${NAIVE_PORT}" ]]; then
  read -rps "Enter your port for Naiveproxy: " NAIVE_PORT
fi

if [[ -z "$NAIVE_USERNAME" || -z "$NAIVE_PASSWORD" || -z "$NAIVE_DOMAIN" || -z "$NAIVE_PORT" ]]; then
  _error "Invalid proxy details. Please provide all required values."
  exit 1
fi

echo -e "Downloading NaiveProxy..."

naive_version=$(curl -s https://api.github.com/repos/klzgrad/naiveproxy/releases/latest | grep tag_name | cut -d '"' -f 4)
naive_released_name=""

if [[ "$OS" == "Darwin" ]]; then
  naive_released_name="naiveproxy-${naive_version}-mac-arm64.tar.xz"
elif [[ "$OS" == "Linux" ]]; then
  naive_released_name="naiveproxy-${naive_version}-linux-amd64.tar.xz"
fi

naive_download_url="https://github.com/klzgrad/naiveproxy/releases/download/${naive_version}/${naive_released_name}"

if ! wget -O ~/Downloads/naiveproxy.tar.xz "$naive_download_url"; then
  _error "Failed to download NaiveProxy archive."
  exit 1
fi

if ! tar -xf ~/Downloads/naiveproxy.tar.xz -C ~/Downloads; then
  _error "Failed to extract NaiveProxy archive."
  exit 1
fi

echo -e "Configuring NaiveProxy..."

# Update config.json with proxy details and log file path
config_file="$HOME/Downloads/naive/config.json"
log_file="$HOME/Downloads/naiveproxy/naiveproxy.log"

if [[ ! -f "$config_file" ]]; then
  _error "NaiveProxy config file not found: $config_file"
  exit 1
fi

# Update config.json file with proxy details and log file position
sed -i "s@\"proxy\":.*@\"proxy\": \"https://$NAIVE_USERNAME:$NAIVE_PASSWORD@$NAIVE_DOMAIN:$NAIVE_PORT\",@" "$config_file"
sed -i "s@\"log\":.*@\"log\": \"$log_file\",@" "$config_file"

export HTTP_PROXY="http://127.0.0.1:1080"
export HTTPS_PROXY="http://127.0.0.1:1080"
export NO_PROXY="localhost,127.0.0.1,::1"

echo -e "Starting NaiveProxy ..."

chmod +x ~/Downloads/naiveproxy/naive

nohup ~/Downloads/naiveproxy/naive >/dev/null 2>&1 &

sleep 5

# Check if NaiveProxy is running and accepting connections

json_response=$(curl --socks5-hostname 127.0.0.1:1080 http://wtfismyip.com/json)

country_code=$(echo "$json_response" | grep -o '"YourFuckingCountryCode": "[^"]*"' | cut -d'"' -f4)

city=$(echo "$json_response" | grep -o '"YourFuckingCity": "[^"]*"' | cut -d'"' -f4)

if [[ "$country_code" == "US" && "$city" == "East Los Angeles" ]]; then
  _success "NaiveProxy is working correctly."
else
  _error "Failed to connect to NaiveProxy. Please check if NaiveProxy is running and try again."
  exit 1
fi

#################################################

_info "STEP 2. Ansible Installation"

if [[ "$OS" == "Darwin" ]]; then

  if ! brew --version; then
    echo -e "${RED}Error: Homebrew is not installed.${NC}"
    echo -e "Installing Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
  fi

  if ! brew update; then
    _error "Failed to update Homebrew packages."
    exit 1
  fi

  if ! brew install ansible; then
    _error "Failed to install Ansible."
    exit 1
  fi
elif [[ "$OS" == "Linux" ]]; then
  if ! sudo dnf update; then
    _error "Failed to update dnf packages."
    exit 1
  fi

  if ! sudo dnf install -y ansible; then
    _error "Failed to install Ansible."
    exit 1
  fi
fi

if ! ansible --version; then
  _error "Ansible is not installed as expected."
  exit 1
fi

###############################################

_info "STEP 3. Get Dotfiles"

# Go to the home dir and create `Projects` folder
cd || _error "Failed to cd to home directory."

if [ -f "Projects" ]; then
  mkdir -p Projects
fi

echo -e "Fetching dotfiles..."

# In case git is not installed
if ! git --version; then
  echo -e "${RED}Error: Git is not installed.${NC}"
  echo -e "${YELLOW}Installing Git...${NC}"
  if [[ "$OS" == "Darwin" ]]; then
    brew install git
  else
    sudo dnf install -y git
  fi
fi

if ! git clone https://github.com/escwxyz/dotfiles.git ~/Projects; then
  _error "Failed to fetch dotfiles."
  exit 1
fi

echo -e "Updating submodules..."

cd "Projects/dotfiles" || _error "Projects/dotfiles not found."

if ! git submodule update --init --recursive; then
  _error "Failed to update submodules."
  exit 1
fi

#################################################

_info "STEP 4. Run Ansible"

echo -e "Running Ansible..."

# We use the requirements.yml for this
# # NOTE: see https://galaxy.ansible.com/ui/repo/published/community/general/
# if ! ansible-galaxy collection install community.general; then
#   _error "Failed to install Ansible community collection."
#   exit 1
# fi

# TODO: adjust the command after finishing playbooks
#
if ! ansible-playbook playbook.yml -K; then
  _error "Failed to run Ansible."
  exit 1
fi

################################################

_info "STEP 5. Cleanup"

cd || _error "Failed to cd to home directory."

echo -e "Cleaning up..."

rm -rf ~/Downloads/naiveproxy.tar.xz >dev/null 2>&1

unset HTTPS_PROXY
unset HTTP_PROXY
unset NO_PROXY

echo -e "${GREEN}:) All set. Happy hacking!${NC}"
