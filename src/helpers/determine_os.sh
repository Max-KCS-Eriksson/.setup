#!/usr/bin/env bash

determine_os() {
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        OS=$(echo "$NAME" | awk '{print tolower($0)}')
    else
        warn 'Cannot determine OS'
        exit 1
    fi
}
