{ config, pkgs, lib, libs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        title = "Alacritty";
        opacity = 0.99;

        position = {
          x = 900;
          y = 350;
        };
        dimensions = {
          lines = 40;
          columns = 125;
        };
      };

      general = {
        live_config_reload = true;
      };

      cursor.vi_mode_style = "Underline";

      terminal.shell.program = "${pkgs.zsh}/bin/zsh";
      font = {
        normal.family = "FiraCode Nerd Font";
        normal.style = "Regular";
        bold.style = "Bold";
        italic.style = "Italic";
        bold_italic.style = "Bold Italic";
        size = 17.0;
      };

      colors = { draw_bold_text_with_bright_colors = true; };
    };

  };
}
