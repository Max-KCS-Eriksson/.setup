#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")/../../..
source "$ROOT_DIR"/src/helpers/output_labels.sh

# Runtime executor
# https://github.com/jdxcode/mise

# Install and use globally
GLOBALS_USED=(
    node@lts
    lua@latest
    luajit@latest
    go@latest
    java@21
    maven@latest
    gradle@latest
    spring-boot@latest
    sqlite@latest
)

# Install only
ENSURE_INSTALLED=(
    python@3.9
    python@3.10
    python@3.11
    java@adoptopenjdk-8
    java@11
    java@17
)

# Check that `mise` is installed
if ! command -v mise &>/dev/null; then
    warn 'command not found: mise'
    exit 1
fi

# Install from above lists
for tool in "${GLOBALS_USED[@]}"; do
    mise install "$tool"
    mise use -g "$tool"
done

for tool in "${ENSURE_INSTALLED[@]}"; do
    mise install "$tool"
done
