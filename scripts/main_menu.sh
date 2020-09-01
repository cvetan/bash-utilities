#!/bin/bash

function display_main_menu() {
    echo 'Choose one of the tasks or exit: '
    echo '[1.] Adminer taks'

    read selected

    if [[ $selected == '1' ]]; then
        display_adminer_menu
    elif [[ $selected == '' ]]; then
        echo 'Goodbye...'
        exit 0
    else
        display_main_menu
    fi
}
