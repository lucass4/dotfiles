{ config, pkgs, lib, libs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        title = "Terminal";

        position = {
          x = 900;
          y = 350;
        };
        dimensions = {
          lines = 40;
          columns = 125;
        };
      };

      font = {
        normal.family = "SauceCodePro Nerd Font";
        size = 15.0;
      };

      window.opacity = 0.99;

      shell = {
        program = "${pkgs.fish}/bin/fish";
        args = [ "--init-command" "echo; neofetch; echo" ];
      };

      colors = { };
    };

  };
}
