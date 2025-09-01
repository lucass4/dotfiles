{ config, xdg, lib, pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      default_shell = "${pkgs.zsh}/bin/zsh";
      scrollback_size = 1000000;
      copy_command = "pbcopy";
      simplified_ui = true;
      show_startup_tips = false;
      pane_frames = false;
      default_mode = "normal";
      mouse_mode = true;
      copy_on_select = true;
      plugins = {
        "tab-bar" = "zellij:tab-bar";
        "status-bar" = "zellij:status-bar";
        "strider" = "zellij:strider";
        "compact-bar" = "zellij:compact-bar";
        "session-manager" = "zellij:session-manager";
        "welcome-screen" = {
          location = "zellij:session-manager";
          welcome_screen = true;
        };
        filepicker = {
          location = "zellij:strider";
          cwd = "/";
        };
        configuration = "zellij:configuration";
        "plugin-manager" = "zellij:plugin-manager";
        about = "zellij:about";
      };
    };
  };
}
