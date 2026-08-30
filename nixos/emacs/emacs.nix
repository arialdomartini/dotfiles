{ config, nixpkgs-unstable, ... }:

# This assumes that the repository dotfiles is in ~/prg/dotfiles
let
  system = "x86_64-linux";
  emacs31 = nixpkgs-unstable.legacyPackages.${system}.emacs31-gtk3;
in
{
  programs.emacs = {
    enable = true;
    package = emacs31;
  };

  # this translates to ~/.config/emacs/
  xdg.configFile."emacs".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/prg/dotfiles/emacs/.config/emacs";
}
