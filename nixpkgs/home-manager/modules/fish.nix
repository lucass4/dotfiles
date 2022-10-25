{ config, lib, pkgs, ... }: {

  programs.fish.enable = true;
  programs.fish = {
    interactiveShellInit = ''
      set PATH ~/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH
      # Setup terminal, and turn on colors

      # language settings
      set -x LANG en_US.UTF-8
      set -x LC_CTYPE "en_US.UTF-8"
      set -x LC_MESSAGES "en_US.UTF-8"
      set -x LC_COLLATE C
      set -g theme_nerd_fonts yes
      set -g theme_color_scheme solarized

      set EDITOR nvim
      # Enable direnv
      if command -v direnv &>/dev/null
          eval (direnv hook fish)
      end
      # Enable zoxice `z` (https://github.com/ajeetdsouza/zoxide)
      if command -v zoxide &>/dev/null
        zoxide init fish | source
      end
    '';

    plugins = [
      {
        name = "bobthefish";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-bobthefish";
          rev = "e69150081b0e576ebb382487c1ff2cb35e78bb35";
          sha256 = "sha256-/x1NlbhxRZjrsk4C0mkSQi4zzpOaxL1O1vvzDHhGQk0=";
        };
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }

    ];
  };

}

