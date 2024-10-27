{ pkgs, config, ... }:

let
  dotdir = "${config.xdg.configHome}/zsh";
in
{
  home.packages = [ pkgs.zsh ];

  home.file = {
    "${dotdir}/.zshrc".source = ../../../zsh/.zshrc;
    "${dotdir}/zshenv".source = ../../../zsh/.zshenv;
  };
  
  home.sessionVariables = {
    ZDOTDIR = "${dotdir}";
  };
}
