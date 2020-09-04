#!/bin/bash

function display_main_menu() {
    echo 'Choose one of the tasks or exit: '
    echo '[1] Adminer taks'
    echo '[2] Exit'

    read selected

    if [[ $selected == '1' ]]; then
        display_adminer_menu
    elif [[ $selected == '' || $selected == '2' ]]; then
        echo 'Goodbye...'
        exit 0
    else
        display_main_menu
    fi
}
