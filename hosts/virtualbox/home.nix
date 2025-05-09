{ lib, pkgs, config, ... }:  

{
  home.username = "logan";
  home.homeDirectory = "/home/logan";
  
  # Import your modules (like Firefox)
  imports = [
    ../../modules/programs/firefox.nix
    ../../modules/programs/git.nix
    ../../modules/programs/ssh.nix
    ../../modules/programs/neovim/neovim.nix
    ../../modules/desktop/hyprland.nix
    # ../../modules/desktop/theme.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # Did you read the comment?
}
