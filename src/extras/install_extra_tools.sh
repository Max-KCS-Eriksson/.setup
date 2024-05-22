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

# Install extra tools
# Place script to install and setup a tool in the `tools` dir.
for tool in "$HERE"/tools/*; do
    if [[ -f $tool ]]; then
        install_tool "$tool"
    fi
done
