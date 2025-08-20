#!/usr/bin/env bash

# from https://jade.fyi/blog/use-nix-less/
#
scriptfile=$(readlink -f "$0")
cd "$(dirname -- "$scriptfile")"

cmd=${1:-switch}
shift
# Run the dotfiles script to make the symlinks
../dotfiles.sh
sudo darwin-rebuild "$cmd" --flake ~/.config/nix-darwin
