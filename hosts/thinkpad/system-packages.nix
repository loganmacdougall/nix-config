{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    blueman
    brightnessctl
    cage
    cargo
    clang-tools
    eww
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
    rustc
    tree
    ulauncher
    vlc
    wget
  ];
}
