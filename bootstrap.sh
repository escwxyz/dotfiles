#!/bin/bash
# Script to config proxy and bootstrap ansible

# set -x

# Color decorations
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Operation system check

OS=$(uname -s)

if [[ "$OS" != "Darwin" && "$OS" != "Linux" ]]; then
  echo -e "${RED}Error: Unsupported platform. Only MacOS and Linux are supported.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
elif [[ "$OS" == "Linux" ]]; then
  if [ ! -f /etc/fedora-release ]; then
    echo -e "${RED}Error: This script is only supported on Fedora.${NC}"
    echo -e "${RED}Exiting.${NC}"
    exit 1
  fi
fi

echo -e "${GREEN}This script will bootstrap all the installations of dotfiles as well as applications for your machine.${NC}"
echo -e "${GREEN}We need to configure the proxy first to continue. Please provide the following details:${NC}"

# Prompt for proxy details or use environment variables
if [[ -z "${USERNAME}" ]]; then
  read -rps "Enter your username for Naiveproxy: " USERNAME
fi

if [[ -z "${PASSWORD}" ]]; then
  read -rps "Enter your password for Naiveproxy: " PASSWORD
fi

if [[ -z "${DOMAIN}" ]]; then
  read -rps "Enter your domain address for Naiveproxy: " DOMAIN
fi

if [[ -z "${PORT}" ]]; then
  read -rps "Enter your port for Naiveproxy: " PORT
fi

echo -e "${YELLOW}Downloading NaiveProxy...${NC}"

naive_version=$(curl -s https://api.github.com/repos/klzgrad/naiveproxy/releases/latest | grep tag_name | cut -d '"' -f 4)
naive_released_name=""

if [[ "$OS" == "Darwin" ]]; then
  naive_released_name="naiveproxy-${naive_version}-mac-arm64.tar.xz"
elif [[ "$OS" == "Linux" ]]; then
  naive_released_name="naiveproxy-${naive_version}-linux-amd64.tar.xz"
fi

naive_download_url="https://github.com/klzgrad/naiveproxy/releases/download/${naive_version}/${naive_released_name}"

if ! wget -O ~/Downloads/naiveproxy.tar.xz "$naive_download_url"; then
  echo -e "${RED}Error: Failed to download NaiveProxy.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
fi

if ! tar -xf ~/Downloads/naiveproxy.tar.xz -C ~/Downloads; then
  echo -e "${RED}Error: Failed to extract NaiveProxy archive.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
fi

echo -e "${YELLOW}Configuring NaiveProxy ...${NC}"

# Update config.json file with proxy details
sed -i "s/\"proxy\": \".*\"/\"proxy\": \"https:\/\/${USERNAME}:${PASSWORD}@${DOMAIN}:${PORT}\"/" ~/Downloads/naiveproxy/config.json

export HTTP_PROXY="http://127.0.0.1:1080"
export HTTPS_PROXY="http://127.0.0.1:1080"
export NO_PROXY="localhost,127.0.0.1,::1"

# Launch NaiveProxy
echo -e "${YELLOW}Starting NaiveProxy ...${NC}"

chmod +x ~/Downloads/naiveproxy/naive

nohup ~/Downloads/naiveproxy/naive >/dev/null 2>&1 &

sleep 3

# Install Ansible

echo -e "${YELLOW}Installing Ansible ...${NC}"

if [[ "$OS" == "Darwin" ]]; then

  if ! brew --version; then
    echo -e "${RED}Error: Homebrew is not installed.${NC}"
    echo -e "${YELLOW}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if ! brew update; then
    echo -e "${RED}Error: Failed to update Homebrew.${NC}"
    echo -e "${RED}Exiting.${NC}"
    exit 1
  fi

  if ! brew install ansible; then
    echo -e "${RED}Error: Failed to install Ansible.${NC}"
    echo -e "${RED}Exiting.${NC}"
    exit 1
  fi
elif [[ "$OS" == "Linux" ]]; then
  if ! sudo dnf update; then
    echo -e "${RED}Error: Failed to update packages.${NC}"
    echo -e "${RED}Exiting.${NC}"
    exit 1
  fi

  if ! sudo dnf install ansible; then
    echo -e "${RED}Error: Failed to install Ansible.${NC}"
    echo -e "${RED}Exiting.${NC}"
    exit 1
  fi
fi

if ! ansible --version; then
  echo -e "${RED}Error: Failed to install Ansible.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
fi

# Go to the home dir and create `Projects` folder
cd || exit

if [ -f "Projects" ]; then
  mkdir -p Projects
fi

echo -e "${YELLOW}Cloning dotfiles ...${NC}"

# In case git is not installed
if ! git --version; then
  echo -e "${RED}Error: Git is not installed.${NC}"
  echo -e "${YELLOW}Installing Git...${NC}"
  if [[ "$OS" == "Darwin" ]]; then
    brew install git
  else
    sudo dnf install git
  fi
fi

if ! git clone https://github.com/escwxyz/dotfiles.git ~/Projects; then
  echo -e "${RED}Error: Failed to clone dotfiles repository.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
fi

echo -e "${YELLOW}Updating submodules ...${NC}"

if ! git submodule update --init --recursive; then
  echo -e "${RED}Error: Failed to update git submodules.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
fi

cd "Projects/dotfiles" || exit

echo -e "${YELLOW}Running playbook ...${NC}"

# TODO: adjust the command after finishing playbooks
#
if ! ansible-playbook playbook.yml -K; then
  echo -e "${RED}Error: Failed to run Ansible playbook.${NC}"
  echo -e "${RED}Exiting.${NC}"
  exit 1
fi

echo -e "${YELLOW}Cleaning up ...${NC}"

cd || exit

rm -rf ~/Downloads/naiveproxy.tar.xz

unset HTTPS_PROXY
unset HTTP_PROXY
unset NO_PROXY

echo -e "${GREEN}All works done.${NC}"
