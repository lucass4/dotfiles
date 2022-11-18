{ lib, manual, config, pkgs, ... }: {
  imports = [
    ./modules/alacritty.nix
    ./modules/fish.nix
    ./modules/common.nix
    ./modules/git.nix
    ./modules/nvim.nix
    ./modules/tmux.nix
    ./modules/yabai.nix
    ./modules/skhd.nix
    ./modules/languages/docker.nix
    ./modules/languages/go.nix
    ./modules/languages/lua.nix
    ./modules/languages/markup.nix
    ./modules/languages/node.nix
    ./modules/languages/python.nix
    ./modules/languages/rust.nix
    ./modules/languages/terraform.nix
    ./modules/languages/nix.nix
    ./modules/languages/bash.nix
  ];

  home.username = "lucas.anna";
  home.homeDirectory = "/Users/lucas.anna";

  home.stateVersion = "22.05";
  home.activation = {
    aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      app_folder=$(echo ~/Applications);
      for app in $(find "$genProfilePath/home-path/Applications" -type l); do
        $DRY_RUN_CMD rm -f $app_folder/$(basename $app)
        $DRY_RUN_CMD osascript -e "tell app \"Finder\"" -e "make new alias file at POSIX file \"$app_folder\" to POSIX file \"$app\"" -e "set name of result to \"$(basename $app)\"" -e "end tell"
      done
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.tmux.enable = true;
  manual.manpages.enable = false;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "1password-cli" ];
}
