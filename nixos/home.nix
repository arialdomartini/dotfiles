{ config, pkgs, ... }:

{
  home.username = "arialdo";
  home.homeDirectory = "/home/arialdo";

  home.stateVersion = "26.05";

  imports = [
    ./emacs/emacs.nix
  ];
  
  home.packages = with pkgs; [
    git
    jujutsu
    ripgrep
    fd
    notmuch
    fish
  ];

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;  
  };
}
