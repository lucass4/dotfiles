{ config, xdg, lib, pkgs, ... }: {
  programs.zellij= {
    enable = true;
    enableZshIntegration = true;
    settings =
     {
       theme = "custom";
       themes.custom.fg = "#ffffff";

	tmux = {
   		 bind "[" { SwitchToMode "Scroll"; }
      bind "Ctrl a" { Write 2; SwitchToMode "Normal"; }
   
      # Your updated splits
      bind "!" { NewPane "Right"; SwitchToMode "Normal"; }
      bind "-" { NewPane "Down"; SwitchToMode "Normal"; }
   
      # New window / tab
      bind "n" { NewTab; SwitchToMode "Normal"; }
   
      # Kill bindings
      bind "x" { CloseFocus; SwitchToMode "Normal"; }
      bind "k" { CloseTab; SwitchToMode "Normal"; }
      bind "q" { KillSession; }
   
      # Reload config (mapped to Zellij’s equivalent)
      bind "r" { ReloadConfig; SwitchToMode "Normal"; }
   
      # Layout
      bind "t" { NextSwapLayout; SwitchToMode "Normal"; }
   
      # Keep the rest
      bind "z" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
      bind "," { SwitchToMode "RenameTab"; }
      bind "p" { GoToPreviousTab; SwitchToMode "Normal"; }
      bind "o" { FocusNextPane; }
      bind "Space" { NextSwapLayout; }
      bind "Left" { MoveFocus "Left"; SwitchToMode "Normal"; }
      bind "Right" { MoveFocus "Right"; SwitchToMode "Normal"; }
      bind "Down" { MoveFocus "Down"; SwitchToMode "Normal"; }
      bind "Up" { MoveFocus "Up"; SwitchToMode "Normal"; }
      bind "h" { MoveFocus "Left"; SwitchToMode "Normal"; }
      bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }
      bind "j" { MoveFocus "Down"; SwitchToMode "Normal"; }
      bind "k" { MoveFocus "Up"; SwitchToMode "Normal"; }
      bind "d" { Detach; }
};
}
  };
}
