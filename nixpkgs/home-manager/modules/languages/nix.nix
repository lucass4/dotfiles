{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ nixfmt nixpkgs-fmt ];
}
