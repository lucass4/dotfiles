.PHONY: setup build clean switch switchx update clean-nix check-updates show-updates

HOSTNAME := $(shell hostname -s) # Use short hostname for consistency with aliases

setup: ## Install Homebrew and Nix
	@echo "Setting up environment..."
	# Check if Homebrew is installed
	if ! command -v brew >/dev/null 2>&1; then \
		echo "Homebrew not found. Installing Homebrew..."; \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew is already installed."; \
	fi
	# Check if Nix is installed
	if ! command -v nix >/dev/null 2>&1; then \
		echo "Nix not found. Installing Nix..."; \
		curl -L https://nixos.org/nix/install | sh; \
	else \
		echo "Nix is already installed."; \
	fi
	@echo "Setup complete!"

build: switchx ## Apply Nix-Darwin configuration (default build)
	@echo "Build complete!"

switch: ## Apply Nix-Darwin configuration with Cachix
	@echo "Applying Nix configuration for $(HOSTNAME) with Cachix..."
	cachix watch-exec zmre darwin-rebuild -- switch --flake .#$(HOSTNAME)

switchx: ## Apply Nix-Darwin configuration without Cachix
	@echo "Applying Nix configuration for $(HOSTNAME) without Cachix..."
	darwin-rebuild switch --flake .#$(HOSTNAME)

update: switch ## Update flake inputs, Homebrew, and apply Nix configuration
	@echo "Updating flake inputs and Homebrew..."
	nix flake update
	/opt/homebrew/bin/brew update
	/opt/homebrew/bin/brew upgrade
	/opt/homebrew/bin/brew upgrade --cask --greedy
	$(MAKE) show-updates # Call show-updates target

clean: ## Clean up build artifacts
	@echo "Cleaning up build artifacts..."
	rm -rf result
	@echo "Clean complete!"

clean-nix: ## Clean up Nix generations and garbage collect
	@echo "Cleaning up Nix environment..."
	sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/system
	sudo nix-collect-garbage --delete-older-than 30d
	nix store optimise
	@echo "Nix cleanup complete!"

check-updates: ## Check for Nix and Homebrew updates
	@echo "Checking for Nix and Homebrew updates..."
	nix flake update
	darwin-rebuild build --flake .#$(HOSTNAME) && nix store diff-closures /nix/var/nix/profiles/system result
	/opt/homebrew/bin/brew update >& /dev/null && /opt/homebrew/bin/brew upgrade -n -g
	@echo "Update check complete!"

show-updates: ## Show diff between current and previous Nix system generations
	@echo "Showing Nix system generation diff..."
	zsh -c "nix store diff-closures /nix/var/nix/profiles/system-*-link(om[2]) /nix/var/nix/profiles/system-*-link(om[1])"
	@echo "Nix system generation diff complete!"