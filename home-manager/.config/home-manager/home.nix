{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
  ];

  home = {
    stateVersion = "24.05";
    username = "arialdo";
    homeDirectory = "/home/arialdo";

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 35;
    };
  };

  nixpkgs.config.allowUnfree = true;
  
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home.packages = with pkgs; [
    jetbrains.rider
    ripgrep
    onlyoffice-bin
  ];


  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
