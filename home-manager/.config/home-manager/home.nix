{ config, pkgs, ... }:

{
  home = {
    stateVersion = "24.05";
    username = "arialdo";
    homeDirectory = "/home/arialdo";
  };

  # imports = [
  #   ./firefox.nix
  # ];
  
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
    };
  };

  home.packages = with pkgs; [

  ];

  # TODO find a a way to move these files in program.git
  xdg.configFile."git/config".source = ../../git/config;
  xdg.configFile."git/.gitignore-global".source = ../../git/.gitignore-global;

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
