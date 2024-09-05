{ config, lib, pkgs, ... }: {
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;
    # let's the terminal track current working dir but only builds on linux
    enableVteIntegration = if pkgs.stdenvNoCC.isDarwin then false else true;

    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save = 100000; # save 10,000 lines of history
    };
    envExtra = ''
      # don't use global env as it will slow us down
      skip_global_compinit=1
    '';
    completionInit = ''
      # only update compinit once each day
      # better solution would be to pre-build zcompdump with compinit call then link it in
      # and never recalculate
      autoload -Uz compinit
      for dump in ~/.zcompdump(N.mh+24); do
        compinit
      done
      compinit -C
    '';
    initExtra = ''
      # Setup zoxide
      eval "$(zoxide init zsh)"
      path+=/Users/lucas/bin

    '';
    sessionVariables = { };
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
    oh-my-zsh.enable = true;
    oh-my-zsh.plugins = [ "sudo" "vim-interaction" "fzf" "vi-mode" "zoxide" ];
    shellAliases = {
      ls = "eza --icons --git-ignore --git -F --extended";
      l = "eza --icons --git-ignore --git -F --extended";
      ll = "eza --icons --git-ignore --git -F --extended -l";
      lt = "eza --icons --git-ignore --git -F --extended -T";
      llt = "eza --icons --git-ignore --git -F --extended -l -T";
      fd = "\\fd -H -t d"; # default search directories
      f = "\\fd -H"; # default search this dir for files ignoring .gitignore etc
      g = "git";
      gst = "git status -s";
      kn = "kubectl config set-context --current --namespace";
      ga = "git add";
      glo =
        "git log --pretty=format:'%C(yellow)%h %Cred%ar %Cblue%an%Cgreen%d %Creset%s' --date=short";
      gd = "git diff";
      gl = "git pull";
      gp = "git push";
      gc = "git commit";
      gco = "git checkout";
      gcl = "git clone";
      gcm = "git checkout main";
      d = "docker";
      dc = "docker compose";
      k = "kubectl";
      tg = "terragrunt";
      tf = "terraform";
      vim = "nvim";
      vi = "nvim";
      assume="source /opt/homebrew/bin/assume";

      fz =
        "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      grep = "rg";
      rm = "trash";
      du = "dust";

      findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";
    } // pkgs.lib.optionalAttrs pkgs.stdenv.isDarwin {
      # Figure out the uniform type identifiers and uri schemes of a file (must specify the file)
      # for use in SwiftDefaultApps
      dwupdate =
        "pushd ~/.config/nixpkgs ; nix flake update ; /opt/homebrew/bin/brew update; popd ; dwswitch ; /opt/homebrew/bin/brew upgrade ; /opt/homebrew/bin/brew upgrade --cask --greedy; dwshowupdates; popd";
      dwswitch =
        "pushd ~; cachix watch-exec zmre darwin-rebuild -- switch --flake ~/.config/nixpkgs/.#$(hostname -s) ; popd";
      dwswitchx =
        "pushd ~; darwin-rebuild switch --flake ~/.config/nixpkgs/.#$(hostname -s) ; popd";
      dwclean =
        "pushd ~; sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/system; sudo nix-collect-garbage --delete-older-than 30d ; nix store optimise ; popd";
      dwupcheck =
        "pushd ~/.config/nixpkgs ; nix flake update ; darwin-rebuild build --flake ~/.config/nixpkgs/.#$(hostname -s) && nix store diff-closures /nix/var/nix/profiles/system ~/.config/nixpkgs/result; brew update >& /dev/null && brew upgrade -n -g; popd"; 
      dwshowupdates = ''
        zsh -c "nix store diff-closures /nix/var/nix/profiles/system-*-link(om[2]) /nix/var/nix/profiles/system-*-link(om[1])"'';
    }; 
  };
}
