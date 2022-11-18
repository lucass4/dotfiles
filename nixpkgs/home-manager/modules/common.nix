{ config, pkgs, libs, ... }: {

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs;
    [
      du-dust # better du
      exa # better ls
      neofetch # fancy system + hardware info
      tealdeer # fast tldr
      dogdns # replacement for dig
      ripgrep # replacement for grep
      fd # replacement for find
      bat # replacement for cat
      trash-cli # a better rm tool
      zoxide # better jump written in Rust
      spotify-tui

      _1password

      git
      gitAndTools.gh
      git-crypt
      git-lfs
      hub

      fzf
      tree
      httpstat
      curlie
      wget
      speedtest-cli
      cloc

      # Compression
      zip
      pigz
      lz4

      # Kubernetes 
      kubectx
      kubectl
      krew
      kubernetes-helm
      colima
      devspace

      nerdfonts
      powerline-fonts
      alacritty
      tmux

      jc
      yq
      jq

      pgcli
      gnupg
      graphviz
      watch
      reattach-to-user-namespace
      awscli2

      # window managemnt and hotkeys
      skhd
      yabai
      sketchybar

    ] ++ lib.optionals stdenv.isDarwin [
      coreutils # provides `dd` with --status=progress
    ];
  programs.dircolors = { enable = true; };
}
