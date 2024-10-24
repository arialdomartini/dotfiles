{ config, pkgs, ... }:

{
  home.username = "arialdo";
  home.homeDirectory = "/home/arialdo";

  home.stateVersion = "24.05";

  # imports = [
  #   ./firefox.nix
  # ];
  
  programs = {
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.hs
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/arialdo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
