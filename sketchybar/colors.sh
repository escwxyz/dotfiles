#!/bin/bash

# set -x

# https://material-theme.com/docs/reference/color-palette/

#!/bin/bash

getcolor() {

  color_name=$1
  opacity=$2

  local o100=0xff
  local o75=0xbf
  local o50=0x80
  local o25=0x40
  local o10=0x1a
  local o0=0x00

  local trueblack=#000000

  # TODO everforest
  local blue=#7FBBB3
  local teal=#83C092
  local cyan=#b4f9f8 # TODO
  local grey=#7A8478
  local green=#A7C080
  local yellow=#DBBC7F
  local orange=#E69875
  local red=#E67E80
  local purple=#D699B6
  local black=#2D353B
  local white=#D3C6AA

  case $opacity in
  75) local opacity=$o75 ;;
  50) local opacity=$o50 ;;
  25) local opacity=$o25 ;;
  10) local opacity=$o10 ;;
  0) local opacity=$o0 ;;
  *) local opacity=$o100 ;;
  esac

  case $color_name in
  blue) local color=$blue ;;
  teal) local color=$teal ;;
  cyan) local color=$cyan ;;
  grey) local color=$grey ;;
  green) local color=$green ;;
  yellow) local color=$yellow ;;
  orange) local color=$orange ;;
  red) local color=$red ;;
  purple) local color=$purple ;;
  black) local color=$black ;;
  trueblack) local color=$trueblack ;;
  white) local color=$white ;;
  *)
    echo "Invalid color name: $color_name" >&2
    return 1
    ;;
  esac

  echo $opacity"${color:1}"
}

# Pick color based on day of week
daily_color() {
  DAY_OF_WEEK=$(date +%u)
  local COLORS=("blue" "teal" "cyan" "green" "yellow" "orange" "red" "purple")
  echo "${COLORS[$DAY_OF_WEEK]}"
}

# Pick a random color name
# RANDOMHIGHLIGHT=$(daily_color)

# Bar and item colors
BAR_COLOR=$(getcolor trueblack) # TODO
BAR_BORDER_COLOR=$(getcolor black 0)
HIGHLIGHT=$(getcolor teal)
HIGHLIGHT_75=$(getcolor teal 75)
HIGHLIGHT_50=$(getcolor teal 50)
HIGHLIGHT_25=$(getcolor teal 25)
HIGHLIGHT_10=$(getcolor teal 10)
ICON_COLOR=$(getcolor white)
ICON_COLOR_INACTIVE=$(getcolor white 50)
LABEL_COLOR=$(getcolor white 75)
POPUP_BACKGROUND_COLOR=$(getcolor black 25)
POPUP_BORDER_COLOR=$(getcolor black 0)
SHADOW_COLOR=$(getcolor black)
TRANSPARENT=$(getcolor black 0)

export BAR_COLOR
export BAR_BORDER_COLOR
export HIGHLIGHT
export HIGHLIGHT_75
export HIGHLIGHT_50
export HIGHLIGHT_25
export HIGHLIGHT_10
export ICON_COLOR
export ICON_COLOR_INACTIVE
export LABEL_COLOR
export POPUP_BACKGROUND_COLOR
export POPUP_BORDER_COLOR
export SHADOW_COLOR
export TRANSPARENT
