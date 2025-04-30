#!/usr/bin/env bash

# Git flow completion
# https://github.com/bobthecow/git-flow-completion

ROOT_DIR=$(dirname "$0")/../../..
source "$ROOT_DIR"/src/helpers/output_labels.sh
source "$ROOT_DIR"/src/helpers/determine_os.sh
determine_os

case "$OS" in
'void')
    package_name='gitflow'
    ;;
esac

if ! xbps-query -l | grep -qw "$package_name"; then
    warn "'$package_name' is not installed."
    exit 1
fi

repo_dest="$XDG_DATA_HOME"/git-flow-completion
if [[ ! -d "$repo_dest" ]]; then
    git clone git@github.com:bobthecow/git-flow-completion.git "$repo_dest"
fi

note 'git flow completion needs to be sources'
note 'check https://github.com/bobthecow/git-flow-completion for documentation'
