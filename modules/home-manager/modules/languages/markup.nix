{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ nodePackages.prettier ];
}
