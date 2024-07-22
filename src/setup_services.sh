#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")/..

source "$ROOT_DIR"/src/helpers/determine_os.sh
source "$ROOT_DIR"/src/helpers/output_labels.sh

determine_init_system() {
    case "$OS" in
    'void')
        INIT='runit'
        ;;
    '')
        warn 'Cannot determine init system'
        exit 1
        ;;
    *)
        warn 'Init system support not implemented'
        exit 1
        ;;
    esac
}

setup_services() {
    if [[ $INIT ]]; then
        bash "$ROOT_DIR"/src/services/"$INIT"/services.sh
    fi
}

determine_os
determine_init_system
setup_services
