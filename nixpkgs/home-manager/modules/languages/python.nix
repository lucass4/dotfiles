{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    pre-commit
    cookiecutter
    python310
    yapf
    python310Packages.jupyterlab
  ];
}
