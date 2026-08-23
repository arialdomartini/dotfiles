{ config, pkgs, ... }:

{
  home.username = "arialdo";
  home.homeDirectory = "/home/arialdo";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    git
  ];

  programs.home-manager.enable = true;
}
