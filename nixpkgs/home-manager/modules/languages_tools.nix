{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    go_1_19
    tgswitch
    tfswitch
    nodejs-18_x
    yarn
    python311
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt

    # Necessary for the openssl-sys crate:
    pkgs.openssl
    pkgs.pkg-config
    nixfmt
    lua
    luarocks
  ];
}

