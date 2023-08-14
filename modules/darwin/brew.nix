{ inputs, config, pkgs, ... }: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      #cleanup =
      # "uninstall"; # should maybe be "zap" - remove anything not listed here
    };
    global = { brewfile = true; };

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/core"
      "homebrew/services"
      "koekeishiya/formulae"
      "fujiapple852/trippy"
    ];

    casks = [
      "dash" # offline developer docs
      "discord"
      "gpg-suite"
      "pomatez" # pomodoro timer, but installs itself as startup item and doesn't
      "pgadmin4"
    ];

    masApps = { };
    brews = [
      "trippy" # an mtr alternative
      "pre-commit"
    ];
  };
}
