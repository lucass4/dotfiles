{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ nixfmt-classic nixpkgs-fmt ];
}
