{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ go golines gopls delve revive gotools ];
}
