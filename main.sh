#!/usr/bin/env bash

HERE=$(dirname "$0")

source "$HERE"/src/helpers/output_labels.sh

# Install packages handled by the OS package manager
install_os_packages() {
    if bash "$HERE"/src/install_os_packages.sh; then
        ok 'Installed os packages'
    else
        warn 'Error installing os packages'
        exit 1
    fi
}
install_os_packages
