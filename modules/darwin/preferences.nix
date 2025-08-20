{ inputs, config, pkgs, ... }: {
  system.keyboard.enableKeyMapping = true;
  system.primaryUser = "lucas";
 ids.gids.nixbld = 350;
  system.keyboard.remapCapsLockToEscape = true;
system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
  # backwards compat; don't change
  system.stateVersion = 4;

}
