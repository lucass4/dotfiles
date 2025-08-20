#!/usr/bin/env bash

#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

nix --extra-experimental-features "nix-command flakes" build ".#darwinConfigurations.$(hostname -s).system"

./result/sw/bin/darwin-rebuild switch --flake .
