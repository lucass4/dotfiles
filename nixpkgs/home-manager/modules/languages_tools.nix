{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # go dependencies
    go_1_19
    gopls
    delve
    # terraform dependencies
    tgswitch
    tfswitch
    tflint
    terraform-docs
    pre-commit
    cookiecutter
    # nodejs dependencies
    nodejs-18_x
    yarn
    # python dependencies
    python311
    # rust dependencies
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt

    # Necessary for the openssl-sys crate:
    pkgs.openssl
    pkgs.pkg-config
    nixfmt
    # lua dependencies
    lua
    luarocks
  ];
}

