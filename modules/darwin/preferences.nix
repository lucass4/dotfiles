{ lib, ... }: {
  # Set the primary user for the system.
  system.primaryUser = "lucas";

  # Resolve GID mismatch for the nixbld group as suggested by nix-darwin.
  ids.gids.nixbld = 350;

  # Keyboard settings
  system.keyboard = {
    enableKeyMapping = true;
    # Remap the Caps Lock key to Escape.
    remapCapsLockToEscape = true;
  };

  # macOS system-wide preferences using `system.defaults`.
  system.defaults = {
    # Global domain settings for key repeat.
    NSGlobalDomain = {
      # Key repeat delay (lower is faster). Default is 15 (225ms).
      InitialKeyRepeat = 14; # (210ms)
      # Key repeat rate (lower is faster). Default is 2 (30ms).
      KeyRepeat = 1; # (15ms)
    };

    # Finder-specific settings.
    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
    };

    # Dock-specific settings.
    dock = {
      autohide = true;
    };
  };

  # This value should not be changed after the first build.
  # It's used for backwards compatibility and ensures smooth upgrades.
  system.stateVersion = 4;
}
