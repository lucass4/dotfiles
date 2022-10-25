{ inputs, ... }:
let
  folder = "${inputs.zellij}/config/zellij";
in
{
  home.file.zellij= {
    executable = true;
    target = ".config/zellij/zellij.conf";
    text = ''
    '';
  };
}
