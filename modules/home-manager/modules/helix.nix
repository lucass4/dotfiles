{ config, pkgs, lib, inputs, ... }: {
  programs.helix = {
    enable = true;

    # The catppuccin-mocha theme, provided by the helix-themes flake
    themes = inputs.helix-themes.outputs.themes;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        auto-save = true;
        cursorline = true;
        rulers = [ 120 140 ];
        soft-wrap.enable = true;

        indent-guides = {
          render = true;
          character = "·";
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };

      keys.normal = {
        "space".w = ":w"; # Save with <space>w
        "space".q = ":q"; # Quit with <space>q
        "space".f = [
          ":sh rm -f /tmp/files2open"
          ":set mouse false"
          ":insert-output yazi \"%{buffer_name}\" --chooser-file=/tmp/files2open"
          ":redraw"
          ":set mouse true"
          ":open /tmp/files2open"
          "select_all"
          "split_selection_on_newline"
          "goto_file"
          ":buffer-close! /tmp/files2open"
        ];
        "Y" = "yank_to_clipboard";
        "p" = "paste_after";
        "P" = "paste_before";
      };
    };

    languages = {
      language = [
        {
          name = "rust";
          scope = "source.rust";
          file-types = [ "rs" ];
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "python";
          scope = "source.python";
          file-types = [ "py" ];
          language-servers = [ "pyright" ];
        }
        {
          name = "terraform";
          scope = "source.terraform";
          file-types = [ "tf" "tfvars" ];
          language-servers = [ "terraform-ls" ];
        }
        {
          name = "go";
          scope = "source.go";
          file-types = [ "go" ];
          language-servers = [ "gopls" ];
        }
        {
          name = "bash";
          scope = "source.bash";
          file-types = [ "sh" ];
          language-servers = [ "bash-language-server" ];
        }
        {
          name = "dockerfile";
          scope = "source.dockerfile";
          file-types = [ "Dockerfile" ];
          language-servers = [ "dockerfile-language-server-nodejs" ];
        }
        {
          name = "yaml";
          scope = "source.yaml";
          file-types = [ "yaml" "yml" ];
          language-servers = [ "yaml-language-server" ];
        }
        {
          name = "nix";
          scope = "source.nix";
          file-types = [ "nix" ];
          language-servers = [ "nil" ];
        }
      ];
    };

    extraPackages = with pkgs; [
      rust-analyzer
      pyright
      terraform-ls
      gopls
      bash-language-server
      dockerfile-language-server-nodejs
      yaml-language-server
    ];
  };
}
