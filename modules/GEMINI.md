# Gemini Project Instructions

## My Instructions

When improving my Nix setup, act as a Nix Home Manager and Darwin expert. Check the latest documentation for any packages I ask you to change. Prioritize accuracy over speed and use a chain of thought if necessary.

## Project Goal

This project manages my dotfiles using Nix, home-manager, and Nix-Darwin.

## Directory Structure

*   `flake.nix`: The main entry point for the Nix configuration. It defines dependencies and outputs for the system.
*   `flake.lock`: Locks the versions of all dependencies for reproducible builds.
*   `init.sh`: A script to initialize the environment by installing Nix and Homebrew, and symlinking the configuration.
*   `modules/darwin`: Contains system-level configuration for macOS using Nix-Darwin.
*   `modules/home-manager`: Contains user-level configuration managed by home-manager, such as packages and dotfiles.

## Setup

To set up this configuration on a new machine, run the following script from the root of this repository:

```sh
./init.sh
```

This will:
1.  Install Homebrew and Nix if they are not already installed.
2.  Back up any existing Nix configuration in `~/.config/nix`.
3.  Create a symlink from this repository's `nix` directory to `~/.config/nix`.

## Applying Changes

To apply changes to the configuration, use the following commands:

*   **For system-wide changes (macOS):**
    ```sh
    darwin-rebuild switch --flake .#<your-hostname>
    ```
    Replace `<your-hostname>` with the appropriate output from your `flake.nix`.

*   **For user-specific changes (home-manager):**
    ```sh
    home-manager switch --flake .
    ```

You may need to commit your changes to git before applying them, as flakes work closely with git.
