{ inputs, config, pkgs, ... }: {
programs.zsh.enable = true;
  environment = {
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  users.users."lucas.anna".home = "/Users/lucas.anna";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
