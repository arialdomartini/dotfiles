{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    direnv
    nix-direnv
  ];

  xdg.configFile."direnv/direnvrc".text = ''
    source ${pkgs.nix-direnv}/share/nix-direnv/direnvrc
  '';

}
