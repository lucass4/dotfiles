#{ config, pkgs, lib, ... }: {
#  homebrew = {
#    enable = true;
#    onActivation = {
#      # "zap" removes manually installed brews and casks
#      cleanup = "zap";
#      autoUpdate = true;
#    };
#    brews = [
#      "skhd" # keybinding manager
#      "yabai" # tiling window manager
#
#      # sketchybar
#      "sketchybar" # macos bar alternative
#      "ifstat" # network
#    ];
#
#    casks = [
#      # utilities
#      "aldente" # battery management
#      "bartender" # hides mac bar icons
#
#      # communication
#      "zoom"
#      "slack"
#      "discord"
#      "whatapp"
#
#      "meld" # folder differ
#      "the-unarchiver"
#      "eul" # mac monitoring
#      "kindavim" # vim keys for everything
#      "wireshark" # network sniffer
#      "sf-symbols" # patched font for sketchybar
#    ];
#    taps = [
#      # default
#      "homebrew/bundle"
#      "homebrew/cask"
#      "homebrew/cask-drivers"
#      "homebrew/cask-fonts"
#      "homebrew/core"
#      "homebrew/services"
#      # custom
#      "cmacrae/formulae" # spacebar
#      "koekeishiya/formulae" # yabai
#      "earthly/earthly" # earthly
#      "FelixKratz/formulae" # sketchybar
#    ];
#  };
#}
