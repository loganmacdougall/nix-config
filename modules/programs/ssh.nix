{ lib, pkgs, ... }:

let
  sshKeys = [ "github" "gitlab" ];
in
{
  programs.ssh.enable = true;
  programs.ssh.matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      user = "loganmacdougall";
      port = 22;
      identityFile = "~/.ssh/github";
      identitiesOnly = true;
    };
    "git.cs.dal.ca" = {
      hostname = "git.cs.dal.ca";
      user = "loganmacdougall";
      port = 22;
      identityFile = "~/.ssh/gitlab";
      identitiesOnly = true;
    };
  };

  home.activation.generateSSHKeys = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "$HOME/.ssh"
    
    for key in ${builtins.concatStringsSep " " sshKeys}; do
      if [ ! -f "$HOME/.ssh/$key" ]; then
        ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -f "$HOME/.ssh/$key" -N ""
      fi
    done
  '';
}
