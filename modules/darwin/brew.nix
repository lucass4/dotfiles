{ inputs, config, pkgs, ... }: {
  
  # Homebrew configuration
  homebrew = {
    enable = true;
    
    # Cask arguments
    caskArgs.no_quarantine = true;

    # Activation options
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap"; # Options: "zap" removes anything not listed here; "uninstall" removes installed items
    };

    # Global options
    global.brewfile = true;

    # Homebrew taps
    taps = [
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      "koekeishiya/formulae"
      "fujiapple852/trippy"
      "kreuzwerker/taps"
      "metalbear-co/mirrord"
      "warrensbox/tap"
      "aws/tap"
      "common-fate/granted"
      "aquasecurity/trivy"
    ];

    # Homebrew casks
    casks = [
      "gpg-suite"
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

    # Homebrew MAS apps (currently empty)
    masApps = { };

    # Homebrew brews - grouped logically
    brews = [
      # Networking and monitoring tools
      "trippy"           # An mtr alternative
      "wireshark"
      "eks-node-viewer"

      # Development and language tools
      "pre-commit"
      "lua"
      "luajit"
      "luv"
      "mpdecimal"
      "msgpack"
      "neovim"
      "node"
      "openjdk"
      "pcre2"
      "postgresql@14"
      "readline"
      "tree-sitter"
      "virtualenv"

      # Compression and libraries
      "lz4"
      "lzo"
      "m4"
      "nettle"
      "openssl@1.1"
      "pixman"
      "pkg-config"
      "unbound"
      "unibilium"
      "xorgproto"
      "xz"
      "zstd"
      "libxcb"
      "libxdmcp"
      "libxext"
      "libxrender"
      "libyaml"

      # CLI tools
      "ansiweather"
      "awk"
      "aws-iam-authenticator"
      "cookiecutter"
      "docker-compose"
      "docker-credential-helper"
      "eksctl"
      "fontconfig"
      "goreleaser"
      "jq"
      "just"
      "pipx"

      # Kubernetes tools
      "kubeseal"
      "kustomize"
      "vcluster"

      # AWS and infrastructure tools
      "aws-iam-authenticator"
      "granted"
      "m1-terraform-provider-helper"
      "steampipe"

      # Additional utilities
      "bdw-gc"
      "ca-certificates"
      "go"
      "jpeg-turbo"
      "trivy"
    ];
  };
}

