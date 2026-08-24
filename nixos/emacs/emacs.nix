{ config, ... }:

# This assumes that the repository dotfiles is in ~/prg/dotfiles
{
  programs.emacs.enable = true;  

  # this translates to ~/.config/emacs/
  xdg.configFile."emacs".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/prg/dotfiles/emacs/.config/emacs";
}
