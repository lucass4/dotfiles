{ config, pkgs, lib, ... }: {
  home.file.skhd = {
    target = ".config/skhd/skhdrc";
    text =
      let yabai = "/Users/$USER/.nix-profile/bin/yabai";
      in ''
        # Navigation
        ctrl + alt - h : yabai -m window --focus west
        ctrl + alt - j : yabai -m window --focus south
        ctrl + alt - k : yabai -m window --focus north
        ctrl + alt - l : yabai -m window --focus east

        # Moving windows
        ctrl + shift + alt - h : yabai -m window --warp west
        ctrl + shift + alt - j : yabai -m window --warp south
        ctrl + shift + alt - k : yabai -m window --warp north
        ctrl + shift + alt - l : yabai -m window --warp east'

      '';
  };
}
