# My Dotfiles

[![NixOS](https://img.shields.io/badge/NixOS-unstable-5277C3.svg?style=flat-square&logo=nixos)](https://nixos.org)
[![Home Manager](https://img.shields.io/badge/Home%20Manager-unstable-5277C3.svg?style=flat-square&logo=homemanager)](https://github.com/nix-community/home-manager)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

These are my personal dotfiles, managed with Nix and Home Manager. They are designed to be modular, reproducible, and easy to customize.

## Features

- **Declarative:** The entire system is configured declaratively with Nix.
- **Reproducible:** The `flake.lock` file ensures that the same versions of all packages are used every time.
- **Modular:** The configuration is split into modules, making it easy to add or remove functionality.
- **Cross-platform:** The dotfiles are designed to work on both Linux and macOS.

## Installation

1.  Install [Nix](https://nixos.org/download.html).
2.  Clone this repository to `~/.dotfiles`.
3.  Run the `init.sh` script to install the dotfiles.

```bash
./init.sh
```

## Usage

After the installation is complete, the dotfiles will be automatically sourced by your shell. You can customize the configuration by editing the `.nix` files in the `modules` directory.

## Structure

The project is structured as follows:

- `flake.nix`: The main entry point for the dotfiles.
- `modules/`: Contains the configuration modules.
  - `darwin/`: Modules specific to macOS.
  - `home-manager/`: Home Manager modules for user-level configuration.
- `init.sh`: The installation script.

## Contributing

Contributions are welcome! Please open an issue or a pull request if you have any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.