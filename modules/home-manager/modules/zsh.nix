{ config, lib, pkgs, ... }: {
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    # let's the terminal track current working dir but only builds on linux
    enableVteIntegration = if pkgs.stdenvNoCC.isDarwin then false else true;

    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save = 10000; # save 10,000 lines of history
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

      #zprof
    '';
    sessionVariables = { };
    plugins = [{
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.5.0";
        sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
      };
    }];
    # oh-my-zsh.enable = true;
    # oh-my-zsh.plugins = [
    #   "sudo"
    #   "gitfast"
    #   "vim-interaction"
    #   "docker"
    #   "taskwarrior"
    #   "tmux"
    #   "fzf"
    #   "cargo"
    #   "brew"
    #   "ripgrep"
    #   "vi-mode"
    #   "zoxide"
    # ];
    shellAliases = {
      ls = "ls --color=auto -F";
      l = "exa --icons --git-ignore --git -F --extended";
      ll = "exa --icons --git-ignore --git -F --extended -l";
      lt = "exa --icons --git-ignore --git -F --extended -T";
      llt = "exa --icons --git-ignore --git -F --extended -l -T";
      fd = "\\fd -H -t d"; # default search directories
      f = "\\fd -H"; # default search this dir for files ignoring .gitignore etc
      lf = "~/.config/lf/lfimg";
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
      gcm = "git checkout master";
      d = "docker";
      dc = "docker compose";
      k = "kubectl";
      tg = "terragrunt";
      tf = "terraform";
      vim = "nvim";
      vi="nvim";

      fz =
        "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      grep = "rg";
      rm = "trash";
      du = "dust";
      iam_check = "pipenv run python iam_check/iam_check.py";

      findport = "sudo lsof -iTCP -sTCP:LISTEN -n -P | grep";
      calc = "kalker";
      df = "duf";
      # search for a note and with ctrl-n, create it if not found
      # add subdir as needed like "n meetings" or "n wiki"
      n = "zk edit --interactive";
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
        "pushd ~/.config/nixpkgs ; nix flake update ; darwin-rebuild build --flake ~/.config/nixpkgs/.#$(hostname -s) && nix store diff-closures /nix/var/nix/profiles/system ~/.config/nixpkgs/result; brew update >& /dev/null && brew upgrade -n -g; popd"; # todo: prefer nvd?
      # i use the zsh shell out in case anyone blindly copies this into their bash or fish profile since syntax is zsh specific
      dwshowupdates = ''
        zsh -c "nix store diff-closures /nix/var/nix/profiles/system-*-link(om[2]) /nix/var/nix/profiles/system-*-link(om[1])"'';
    } // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux {
      hmswitch = ''
        nix-shell -p home-manager --run "home-manager switch --flake ~/.config/nixpkgs/.#$(hostname -s)"'';
      noupdate = "pushd ~/.config/nixpkgs; nix flake update; popd; noswitch";
      noswitch =
        "pushd ~; sudo cachix watch-exec zmre nixos-rebuild -- switch --flake ~/.config/nixpkgs/.# ; popd";
    };
  };
}
