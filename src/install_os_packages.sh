#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")/..

source "$ROOT_DIR"/src/helpers/output_labels.sh

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
    case "$OS" in
    'void')
        update() {
            sudo xbps-install -Su --yes xbps
            # XBPS must use a separate transaction to update itself. If your update
            # includes the `xbps` package, a second update is required to apply the rest
            # of the updates.
            sudo xbps-install -Su --yes
        }
        install() {
            sudo xbps-install --yes "$@"
        }

        # Install extra Qtile widget dependencies.
        # XBPS manage system-wide Python installation and packages.
        pip install bs4 --break-system-packages
        pip install selenium --break-system-packages
        ;;
    *)
        warn 'OS support not implemented'
        exit 1
        ;;
    esac
}

install_pkgs_from_list() {
    PACKAGE_LIST=$ROOT_DIR/resources/distro/"$OS"/packages.txt
    if [[ -f $PACKAGE_LIST ]]; then
        # Update package manager
        note "Updating package manager using: \n$(declare -f update)"
        note 'Enter password'
        update

        # Install from package list
        note "Installing packages using: \n$(declare -f install)"
        while read package; do
            install "$package"
        done <"$PACKAGE_LIST"
    else
        warn 'Missing list of packages'
        warn "  Couldn't locate $PACKAGE_LIST"
        exit 1
    fi
}

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
set_pkg_manager_commands
install_pkgs_from_list
determine_init_system
setup_services
