{ config, pkgs, ... }:

{
  imports = [
  ];

  home = {
    stateVersion = "24.11";
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
  ];

  home.file = {
    ".profile".source = ../../../zsh/.profile;
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # DISABLE HOME MANAGER NEWS
  news = {
    display = "silent";
    entries = pkgs.lib.mkForce [ ];
  };
}
