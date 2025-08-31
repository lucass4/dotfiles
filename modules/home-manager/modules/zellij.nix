{ config, xdg, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "custom";
      themes.custom.fg = "#ffffff";

      default_shell = "${pkgs.zsh}/bin/zsh";
      scrollback_size = 10000;
      layout = "compact"; # or "default", "compact", "custom"

      keybinds = [
        {
          # Scroll mode
          key = "[";
          action = "SwitchToMode:Scroll";
        }
        {
          key = "Ctrl+a";
          action = [
            "Write:2"
            "SwitchToMode:Normal"
          ];
        }
        # Splits
        {
          key = "!";
          action = [
            "NewPane:Right"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "-";
          action = [
            "NewPane:Down"
            "SwitchToMode:Normal"
          ];
        }
        # New tab
        {
          key = "n";
          action = [
            "NewTab"
            "SwitchToMode:Normal"
          ];
        }
        # Kill bindings
        {
          key = "x";
          action = [
            "CloseFocus"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "k";
          action = [
            "CloseTab"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "q";
          action = "KillSession";
        }
        # Reload config
        {
          key = "r";
          action = [
            "ReloadConfig"
            "SwitchToMode:Normal"
          ];
        }
        # Layout
        {
          key = "t";
          action = [
            "NextSwapLayout"
            "SwitchToMode:Normal"
          ];
        }
        # Fullscreen
        {
          key = "z";
          action = [
            "ToggleFocusFullscreen"
            "SwitchToMode:Normal"
          ];
        }
        # Rename tab
        {
          key = ",";
          action = "SwitchToMode:RenameTab";
        }
        # Tab navigation
        {
          key = "p";
          action = [
            "GoToPreviousTab"
            "SwitchToMode:Normal"
          ];
        }
        # Pane navigation
        {
          key = "o";
          action = "FocusNextPane";
        }
        # Layout swap
        {
          key = "Space";
          action = "NextSwapLayout";
        }
        # Move focus
        {
          key = "Left";
          action = [
            "MoveFocus:Left"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "Right";
          action = [
            "MoveFocus:Right"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "Down";
          action = [
            "MoveFocus:Down"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "Up";
          action = [
            "MoveFocus:Up"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "h";
          action = [
            "MoveFocus:Left"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "l";
          action = [
            "MoveFocus:Right"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "j";
          action = [
            "MoveFocus:Down"
            "SwitchToMode:Normal"
          ];
        }
        {
          key = "k";
          action = [
            "MoveFocus:Up"
            "SwitchToMode:Normal"
          ];
        }
        # Detach
        {
          key = "d";
          action = "Detach";
        }
        # Toggle status bar
        {
          key = "s";
          action = "ToggleStatus";
        }
      ];
    };
  };
}
