{ config, lib, pkgs, ... }: {
  # Enable Starship prompt and Zsh integration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    # Autosuggestions and syntax highlighting
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # History settings
    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save = 100000; # Save 100,000 lines of history
    };

    # Extra environment settings
    envExtra = ''
      # Skip global compinit to speed up shell startup
      skip_global_compinit=1
    '';

    # Zsh completion initialization
    completionInit = ''
      # Only update compinit once each day
      autoload -Uz compinit
      for dump in ~/.zcompdump(N.mh+24); do
        compinit
      done
      compinit -C
    '';

    # Additional Zsh initialization commands
    initExtra = ''
      # Setup zoxidec
      eval "$(zoxide init zsh)"
      path+=/Users/lucas/bin

      export SDKMAN_DIR="$HOME/.sdkman"
      [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    '';

    # Session variables
    sessionVariables = { };

    # Zsh plugins configuration
    plugins = [{
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.8.0";
        sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
      };
    }];

    # Enable Oh My Zsh and configure plugins
    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" "vim-interaction" "fzf" "vi-mode" "zoxide" ];
    };

    # Shell aliases for improved command usability
    shellAliases = {
      # File and directory management
      ls = "eza --icons --git-ignore --git -F --extended";
      l = "eza --icons --git-ignore --git -F --extended";
      ll = "eza --icons --git-ignore --git -F --extended -l";
      lt = "eza --icons --git-ignore --git -F --extended -T";
      llt = "eza --icons --git-ignore --git -F --extended -l -T";
      fd = "\\fd -H -t d"; # Default search directories
      f = "\\fd -H"; # Search this dir for files, ignoring .gitignore
      grep = "rg"; # Use ripgrep for search
      rm = "trash"; # Use trash instead of rm
      du = "dust"; # Use dust instead of du

      # Git aliases
      g = "git";
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcl = "git clone";
      gcm = "git checkout main";
      gd = "git diff";
      glo = "git log --pretty=format:'%C(yellow)%h %Cred%ar %Cblue%an%Cgreen%d %Creset%s' --date=short";
      gl = "git pull";
      gp = "git push";
      gst = "git status -s";
      rpassword="tr -dc A-Za-z0-9 </dev/urandom | head -c 20 |  pbcopy";

      # Docker and Kubernetes
      d = "docker";
      dc = "docker compose";
      k = "kubectl";
      kn = "kubectl config set-context --current --namespace";
      tg = "terragrunt";
      tf = "terraform";

      # Other aliases
      vim = "nvim";
      vi = "nvim";
      assume = "source /opt/homebrew/bin/assume";
      fz = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";

    } // lib.optionalAttrs pkgs.stdenv.isDarwin {
      # macOS-specific commands
      dwupdate = "pushd ~/.config/nixpkgs ; nix flake update ; /opt/homebrew/bin/brew update; popd ; dwswitch ; /opt/homebrew/bin/brew upgrade ; /opt/homebrew/bin/brew upgrade --cask --greedy; dwshowupdates; popd";
      dwswitch = "pushd ~; cachix watch-exec zmre darwin-rebuild -- switch --flake ~/.config/nixpkgs/.#$(hostname -s) ; popd";
      dwswitchx = "pushd ~; darwin-rebuild switch --flake ~/.config/nixpkgs/.#$(hostname -s) ; popd";
      dwclean = "pushd ~; sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/system; sudo nix-collect-garbage --delete-older-than 30d ; nix store optimise ; popd";
      dwupcheck = "pushd ~/.config/nixpkgs ; nix flake update ; darwin-rebuild build --flake ~/.config/nixpkgs/.#$(hostname -s) && nix store diff-closures /nix/var/nix/profiles/system ~/.config/nixpkgs/result; brew update >& /dev/null && brew upgrade -n -g; popd";
      dwshowupdates = ''
        zsh -c "nix store diff-closures /nix/var/nix/profiles/system-*-link(om[2]) /nix/var/nix/profiles/system-*-link(om[1])" '';
    };
  };
}
