#!/usr/bin/env bash
# Re-apply the theme in every running Neovim (each one listens on a server socket).
set -euo pipefail
shopt -s nullglob
for socket in "${XDG_RUNTIME_DIR:-/tmp}"/nvim.*; do
    [[ -S $socket ]] || continue
    nvim --server "$socket" --remote-expr 'luaeval("require(\"plugins.theme\").apply()")' >/dev/null 2>&1 || true
done
