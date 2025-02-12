{config, pkgs, input, ... }:
{
  programs.git= {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "loganmacdougall";
    userEmail = "loganmac3000@hotmail.com";
    
    extraConfig.pull.rebase = true;
    extraConfig.init.defaultBranch = "main";
  };
}
