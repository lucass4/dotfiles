{ config, lib, pkgs, ... }: { home.packages = with pkgs; [ hadolint ]; }
