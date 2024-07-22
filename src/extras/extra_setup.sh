#!/usr/bin/env bash

HERE=$(dirname "$0")
ROOT_DIR=$(dirname "$0")/..
source "$ROOT_DIR"/helpers/output_labels.sh

install_tool() {
    if bash "$tool"; then
        ok "$tool"
    else
        warn "Error setting up $tool"
        exit 1
    fi
}

# Setup installed tools
# Place script in the `./setup` dir to setup tools handled by the package manager.
for tool in "$HERE"/setup/*; do
    if [[ -f $tool ]]; then
        install_tool "$tool"
    fi
done

# Install extra tools
# Place script in the `./tools` dir to install and setup tools that are not handled by
# the package manager.
for tool in "$HERE"/tools/*; do
    if [[ -f $tool ]]; then
        install_tool "$tool"
    fi
done
