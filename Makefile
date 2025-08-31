.PHONY: setup build clean

setup:
	@echo "Setting up environment..."
	# Check if Homebrew is installed
	if ! command -v brew >/dev/null 2>&1; then \
		echo "Homebrew not found. Installing Homebrew..."; \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1; \
	else 
		echo "Homebrew is already installed."; 
	fi
	# Check if Nix is installed
	if ! command -v nix >/dev/null 2>&1; then \
		echo "Nix not found. Installing Nix..."; \
		curl -L https://nixos.org/nix/install | sh || exit 1; \
	else 
		echo "Nix is already installed."; 
	fi
	@echo "Setup complete!"

build:
	@echo "Building Nix configuration for $(shell hostname)..."
	sudo darwin-rebuild switch --flake .#$(shell hostname)
	@echo "Build complete!"

clean:
	@echo "Cleaning up..."
	rm -rf result
	@echo "Clean complete!"
