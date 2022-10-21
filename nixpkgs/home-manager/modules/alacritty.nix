{ config, pkgs, lib, libs, ... }:
{
  programs.alacritty = {
   settings = ''
   font:
    normal:
        family: SauceCodePro Nerd Font
        style: Regular
    bold:
        family: SauceCodePro Nerd Font
        style: Bold
    italic:
        family: SauceCodePro Nerd Font
        style: Italic

    # Point size of the font
    size: 16
  '' 
  };
  
}
