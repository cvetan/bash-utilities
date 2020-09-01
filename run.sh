#!/bin/bash

# include other scripts
source scripts/adminer.sh
source scripts/main_menu.sh


# verify root privileges
if [[ $EUID > 0 ]]; then # we can compare directly with this syntax.
  echo "You must run script with root privileges!"
  exit 1
fi

display_main_menu
