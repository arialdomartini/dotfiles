{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./direnv.nix
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
    };

  home.packages = with pkgs; [
    smartgithg
    gimp
    ripgrep
    ripgrep-all
    onlyoffice-bin
    unzip
    fd
    jq
  ];

  home.file = {
    ".profile".source = ../../../zsh/.profile;
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
