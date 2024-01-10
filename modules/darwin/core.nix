{ inputs, config, pkgs, ... }: {
  programs.zsh.enable = true;
  environment = {
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  users.users."lucas".home = "/Users/lucas";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
