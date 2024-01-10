{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ go_1_20 gopls delve revive gotools ];
}
