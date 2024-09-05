{ inputs, config, pkgs, ... }: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup =
        "zap"; # "uninstall"; # should maybe be "zap" - remove anything not listed here
    };
    global = { brewfile = true; };

    taps = [
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      "koekeishiya/formulae"
      "fujiapple852/trippy"
      "kreuzwerker/taps"
      "metalbear-co/mirrord"
      "warrensbox/tap"
      "homebrew/cask-fonts"
      "aws/tap"
      "common-fate/granted"
    ];

    casks = [
      "discord"
      "gpg-suite"
      "pgadmin4"
      "pgadmin4"
      "swiftdefaultappsprefpane"
      "default-folder-x"
      "discord"
      "wireshark"
      "font-fira-code"
      "1password"
      "spotify"
      "raycast"
      "alacritty"
    ];

    masApps = { };
    brews = [
      "trippy" # an mtr alternative
      "pre-commit"
      "lua"
      "luajit"
      "luv"
      "lz4"
      "lzo"
      "m1-terraform-provider-helper"
      "m4"
      "mpdecimal"
      "msgpack"
      "neovim"
      "nettle"
      "node"
      "oniguruma"
      "openjdk"
      "openssl@1.1"
      "p11-kit"
      "pcre2"
      "pixman"
      "pkg-config"
      "postgresql@14"
      "pre-commit"
      "readline"
      "steampipe"
      "tree-sitter"
      "unbound"
      "unibilium"
      "virtualenv"
      "xorgproto"
      "xz"
      "zstd"
      "libxcb"
      "ansiweather"
      "libxdmcp"
      "awk"
      "libxext"
      "aws-iam-authenticator"
      "libxrender"
      "bdw-gc"
      "libyaml"
      "ca-certificates"
      "cookiecutter"
      "docker-compose"
      "docker-credential-helper"
      "eksctl"
      "fontconfig"
      "go"
      "goreleaser"
      "jpeg-turbo"
      "jq"
      "just"
      "vcluster"
      "eks-node-viewer"
      "pipx"
      "granted"
      "kubeseal"
      "kustomize"
    ];
  };
}
