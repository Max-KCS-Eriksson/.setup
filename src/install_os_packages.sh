#!/usr/bin/env bash

source "$(dirname "$0")"/helpers/output_labels.sh

determine_os() {
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        OS=$(echo "$NAME" | awk '{print tolower($0)}')
    else
        warn 'Cannot determine OS'
        exit 1
    fi
}

set_pkg_manager_commands() {
    warn 'Not Implemented: set_pkg_manager_commands()'
    exit 1
}

install_pkgs_from_list() {
    warn 'Not Implemented: install_pkgs_from_list()'
    exit 1
}

setup_services() {
    warn 'Not Implemented: setup_services()'
    exit 1
}

determine_os
set_pkg_manager_commands
install_pkgs_from_list
setup_services
