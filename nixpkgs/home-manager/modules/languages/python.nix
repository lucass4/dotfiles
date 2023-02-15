{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    pre-commit
    cookiecutter
    python3
    python310Packages.pip
    yapf
  ];
}
