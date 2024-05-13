#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")/..

source "$ROOT_DIR"/src/helpers/determine_os.sh
source "$ROOT_DIR"/src/helpers/output_labels.sh

determine_init_system() {
    case "$OS" in
    'void')
        INIT='runit'
        ;;
    *)
        warn 'Init system support not implemented'
        exit 1
        ;;
    esac
}

setup_services() {
    warn 'Not Implemented: setup_services()'
    exit 1
}

determine_os
determine_init_system
setup_services
