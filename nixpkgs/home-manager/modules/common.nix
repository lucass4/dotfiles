{ config, pkgs, libs, ... }: {

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs;
    [
      gnupg
      wget
      bat
      fzf
      neofetch # fancy system + hardware info
      tealdeer # fast tldr
      exa
      tree
      du-dust
      dogdns
      ripgrep
      fd
      graphviz
      git-crypt
      httpstat
      curlie
      speedtest-cli
      yarn
      jq
      cloc
      # compression
      zip
      pigz # parallel gzip
      lz4
      git
      # github cli
      gitAndTools.gh
      hub
      kubectx
      kubectl
      krew
      pgcli
      watch
      reattach-to-user-namespace
      git-lfs
      trash-cli
      diff-so-fancy
      jc
      yq
      awscli2
      zoxide
      nerdfonts
      powerline-fonts
      alacritty
      zellij
      vimPlugins.packer-nvim
      nodePackages.lua-fmt


    ] ++ lib.optionals stdenv.isDarwin [
      coreutils # provides `dd` with --status=progress
    ] ++ lib.optionals stdenv.isLinux [
      iputils # provides `ping`, `ifconfig`, ...

      libuuid # `uuidgen` (already pre-installed on mac)
    ];

  programs.dircolors = { enable = true; };

}
