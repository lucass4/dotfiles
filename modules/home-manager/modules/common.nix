{ config, pkgs, libs, ... }: {

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs;
    [
      bash
      zsh
      reattach-to-user-namespace
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
      #devspace
      docker-client

      nerdfonts
      powerline-fonts
      # alacritty
      tmux

      jc
      yq
      jq

      pgcli
      page
      gnupg
      graphviz
      watch
      reattach-to-user-namespace
      awscli2
      silver-searcher
      asdf-vm

    ] ++ lib.optionals stdenv.isDarwin [
      coreutils # provides `dd` with --status=progress
    ];
  programs.dircolors = { enable = true; };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
    defaultCommand = "fd --type f --hidden --exclude .git";
    fileWidgetCommand = "fd --type f"; # for when ctrl-t is pressed
  };

}
