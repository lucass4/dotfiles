{ config, pkgs, lib, libs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        title = "Alacritty";
        opacity = 0.9;

        position = {
          x = 900;
          y = 350;
        };
        dimensions = {
          lines = 40;
          columns = 125;
        };
      };

      live_config_reload = true;

      cursor.vi_mode_style = "Underline";

      shell.program = "${pkgs.zsh}/bin/zsh";
      font = {
        normal.family = "SauceCodePro Nerd Font";
        normal.style = "Regular";
        bold.style = "Bold";
        italic.style = "Italic";
        bold_italic.style = "Bold Italic";
        size = 16.0;
      };

      colors = { draw_bold_text_with_bright_colors = true; };
    };

  };
}
