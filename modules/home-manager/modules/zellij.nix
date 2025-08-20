{ config, xdg, lib, pkgs, ... }: {
  programs.zellij= {
    enable = true;
    enableZshIntegration = true;
  };
}
