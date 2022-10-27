{ config, lib, pkgs, ... }: {

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
                set PATH ~/.nix-profile/bin /nix/var/nix/profiles/default/bin ~/.cargo/bin $GOPATH/bin ~/.npm-global-packages/bin $HOME/bin /usr/local/bin/ $PATH
                # terrafrom config
                set -gx TERRAGRUNT_DISABLE_PROFILE true 

                # Setup terminal, and turn on colors
                set -x TERM xterm-256color

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

      	  	if status is-interactive
         	    eval "$(zellij setup --generate-auto-start fish)"
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

    shellAliases = {
      vim = "nvim";
      kn = "kubectl config set-context --current --namespace";
      l = "exa -l";
      fz =
        "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      ls = "exa --git --icons";
      bat = "cat";
      find = "fd";
      grep = "rg";
      rm = "trash";
    };

    shellAbbrs = {
      g = "git";
      gs = "git status -s";
      ga = "git add";
      gl =
        "git log --pretty=format:'%C(yellow)%h %Cred%ar %Cblue%an%Cgreen%d %Creset%s' --date=short";
      gd = "git diff";
      gp = "git pull";
      gps = "git push";
      gcm = "git commit";
      gco = "git checkout";
      gcl = "git clone";

      d = "docker";
      dc = "docker compose";
      k = "kubectl";
      tg = "terragrunt";
      tf = "terraform";

      findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";
    };
  };
}

