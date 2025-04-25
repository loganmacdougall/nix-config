{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    zoxide
  ];

  programs.bash.enable = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration= true;
    enableFishIntegration= true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  
    options = [ "--cmd cd" ];
  };
}
