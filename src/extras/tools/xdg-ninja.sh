#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")/../../..
source "$ROOT_DIR"/src/helpers/output_labels.sh

if command -v xdg-ninja &>/dev/null; then
    exit
fi

repo_dest="$XDG_DATA_HOME"/xdg-ninja
if [[ ! -d "$repo_dest" ]]; then
    git clone git@github.com:b3nj5m1n/xdg-ninja.git "$repo_dest"
fi

# Place executable in $PATH
wrapper="$HOME"/.local/bin/xdg-ninja

cat >"$wrapper" <<EOM
#!/usr/bin/env bash

bash $repo_dest/xdg-ninja.sh --skip-unsupported
EOM

chmod +x "$wrapper"
