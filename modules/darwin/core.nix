{inputs, config, pkgs, ... }: {
  programs.zsh.enable = true;
  environment = {
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  users.users."lucas".home = "/Users/lucas";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.settings = {
        download-buffer-size = 67108864;
  };
}
