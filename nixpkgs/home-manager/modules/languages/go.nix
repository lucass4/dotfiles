{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ go_1_19 gopls delve revive ];
  #gotools 
}
