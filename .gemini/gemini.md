# Gemini Project Instructions

## My Instructions

When improving my Nix setup, act as a Nix Home Manager and Darwin expert. Check the latest documentation for any packages I ask you to change. Prioritize accuracy over speed and use a chain of thought if necessary.

## Project Goal

This project manages my dotfiles using Nix, home-manager, and Nix-Darwin.

## Directory Structure

*   `flake.nix`: The main entry point for the Nix configuration. It defines dependencies and outputs for the system.
*   `flake.lock`: Locks the versions of all dependencies for reproducible builds.
*   `Makefile`: Contains commands for setup, building, and cleaning the configuration.
*   `modules/darwin`: Contains system-level configuration for macOS using Nix-Darwin.
*   `modules/home-manager`: Contains user-level configuration managed by home-manager, such as packages and dotfiles.

## Setup

To set up this configuration on a new machine, run the following command from the root of this repository:

```sh
mkdir -p ~/.config/nix && ln -s $(pwd)/nix ~/.config/nix
make setup
```

This will:
1.  Create a symlink from this repository's `nix` directory to `~/.config/nix` (if not already present).
2.  Install Homebrew and Nix (if not already present).

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

## GitHub Workflow

When asked to get the repository "github ready", I should follow these steps:

1.  Rebase from `main` or `master`.
2.  Create a branch that takes into consideration the code changes, using conventional commit style.
3.  Commit the code with a meaningful message.
4.  Open a pull request using the `gh` CLI.
5.  Return the URL.