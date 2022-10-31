{ config, pkgs, lib, libs, ... }: {
  programs.git = {
    enable = true;
    userName = "Lucas Sant' Anna";
    userEmail = "76971778+lucass4@users.noreply.github.com";
    signing.key = "56AE81F1E53DC9DC";
    signing.signByDefault = true;

    delta = {
      enable = true;
      options = { side-by-side = true; };
    };

    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
      github.user = "lucass4";

      push.autoSetupRemote = true;

      core.editor = "nvim";
      core.fileMode = false;
      core.ignorecase = false;
    };
  };

}
