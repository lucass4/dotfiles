{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [ go gopls delve revive gotools ];
}
