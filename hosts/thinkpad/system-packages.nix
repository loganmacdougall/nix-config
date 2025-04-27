{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    blueman
    brightnessctl
    cage
    clang-tools
    gcc
    greetd.gtkgreet
    hyprlock
    keepassxc
    kitty
    libgcc
    networkmanagerapplet
    ninja
    pamixer
    python314
    tree
    ulauncher
    vlc
    wget
  ];
}
