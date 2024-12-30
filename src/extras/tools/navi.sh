#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")/../../..
source "$ROOT_DIR"/src/helpers/output_labels.sh

# Command line cheatsheet
# https://github.com/denisidoro/navi

if command -v navi &>/dev/null; then
    exit
fi

# Check that `navi` can be built from source
if ! command -v cargo &>/dev/null; then
    warn 'command not found: cargo'
    warn 'mise cannot be built from source'
    exit 1
fi

src_dest=$XDG_DATA_HOME/navi
git clone https://github.com/denisidoro/navi "$src_dest"
cd "$src_dest" || exit 1
# Set the install directory:
make BIN_DIR=/usr/local/bin install
