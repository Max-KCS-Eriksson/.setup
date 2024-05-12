#!/usr/bin/env bash

LABEL_PREFIX='['
LABEL_SUFIX=']'

warn() {
    LABEL='WARN'
    FORMATTED_PREFIX="$LABEL_PREFIX\033[1;31m$LABEL\033[0m$LABEL_SUFIX"
    echo -e "${FORMATTED_PREFIX} ${1}"
}

ok() {
    LABEL=' OK '
    FORMATTED_PREFIX="$LABEL_PREFIX\033[1;32m$LABEL\033[0m$LABEL_SUFIX"
    echo -e "${FORMATTED_PREFIX} ${1}"
}

note() {
    LABEL='NOTE'
    FORMATTED_PREFIX="$LABEL_PREFIX\033[1;34m$LABEL\033[0m$LABEL_SUFIX"
    echo -e "${FORMATTED_PREFIX} ${1}"
}
