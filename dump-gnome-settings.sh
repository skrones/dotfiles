#!/bin/sh
set -eu

if ! command -v dconf >/dev/null 2>&1; then
    echo "dconf is not installed or is not in PATH" >&2
    exit 1
fi

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
dconf_dir="$source_dir/dot_config/dconf"
gnome_dconf_file="$dconf_dir/gnome.dconf"

mkdir -p "$dconf_dir"

dconf dump /org/gnome/ > "$gnome_dconf_file"

echo "GNOME dconf settings dumped to $gnome_dconf_file"
