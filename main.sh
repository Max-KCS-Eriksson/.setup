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

# Set up system services
setup_services() {
    if bash "$HERE"/src/setup_services.sh; then
        ok 'Sytem services setup'
    else
        warn 'Error setting up system services'
        exit 1
    fi
}
setup_services

# Install extra tools
install_extra_tools() {
    if bash "$HERE"/src/extras/install_extra_tools.sh; then
        ok 'Extra tools installed'
        note 'Additional configuration for extra tools may be needed'
        note 'This can include extending $PATH and other environmental variables, or'
        note 'setting various `eval $(<package> init - )` in the shell configuration'
    else
        warn 'Error installing extra tools'
    fi
}
install_extra_tools
