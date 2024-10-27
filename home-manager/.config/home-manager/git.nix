{ pkgs, ... }:

{
  programs.git = {
    enable = true;
  };

  xdg.configFile."git/config".source = ../../git/config;
  xdg.configFile."git/.gitignore-global".source = ../../git/.gitignore-global;
}
