
# Project Readme

## Overview

This project utilizes the Nix ecosystem to manage and configure a development environment, providing a reproducible and declarative setup for various programming languages, tools, and applications. It leverages `flake.nix` for dependency management and includes configurations for a range of development tools and languages.

## Project Structure

The project consists of the following key files and directories:

- `flake.lock`: Lock file to ensure reproducible builds.
- `flake.nix`: Entry point for Nix Flakes, specifying project dependencies.
- `modules/`: Contains all module definitions for the system.
  - `darwin/`: Modules specific to Darwin (macOS) systems.
    - `brew.nix`: Homebrew package declarations.
    - `core.nix`: Core system configurations for Darwin.
    - `default.nix`: Entry point for Darwin-specific modules.
    - `preferences.nix`: User preferences and settings for Darwin.
  - `home-manager/`: Home Manager configurations for user-level management.
    - `default.nix`: Entry point for Home Manager configurations.
    - `modules/`: Additional modules for specific tools and languages.
      - `alacritty.nix`: Configuration for the Alacritty terminal emulator.
      - `common.nix`: Shared configurations across various modules.
      - `config/nvim`: Configurations for Neovim.
      - `git.nix`: Git configuration and tools.
      - `languages/`: Language-specific configurations.
        - `bash.nix`: Bash shell configurations.
        - `docker.nix`: Docker configurations and tools.
        - `go.nix`: Go language environment setup.
        - `lua.nix`: Lua language configurations.
        - `markup.nix`: Markup languages like HTML, XML configurations.
        - `nix.nix`: Nix language configurations and tools.
        - `node.nix`: Node.js and npm configurations.
        - `python.nix`: Python language environment setup.
        - `rust.nix`: Rust language configurations.
        - `terraform.nix`: Terraform configurations and tools.
      - `nvim.nix`: Neovim editor configurations.
      - `tmux.nix`: TMUX terminal multiplexer configurations.
      - `zsh.nix`: Zsh shell configurations.
    - `script.sh`: Utility script for various tasks.

## Getting Started

To start using this project, ensure you have Nix installed on your system. If you are on macOS, you will also need to have Homebrew installed for managing non-Nix packages.

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `nix-shell` to enter a shell with all dependencies loaded.
4. For Darwin (macOS) systems, navigate to `modules/darwin` and follow the specific instructions there.
5. For Nix and Home Manager configurations, navigate to `modules/home-manager` and follow the setup instructions.

## Customization

You can customize the configurations to suit your needs:

- Edit `*.nix` files under `modules/home-manager/modules/` to change user-level configurations.
- Modify `modules/darwin/*.nix` for system-level configurations on Darwin (macOS).
- Add or remove language-specific modules as needed in `modules/home-manager/modules/languages/`.

## Contributing

Contributions to improve the project are welcome. Please ensure to follow the project's coding standards and commit guidelines when submitting changes.

## License

MIT License

Copyright (c) [2024] [Lucas Sant' Anna]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
