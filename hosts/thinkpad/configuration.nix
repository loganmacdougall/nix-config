# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system-packages.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Halifax";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      source-han-sans
      open-sans
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      roboto-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Open Sans" "Source Han Serif"];
        emoji = ["Noto Color Emoji"];
      };
    };
    enableDefaultPackages = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}/bin/gtkgreet";
        user = "greeter";
      };
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "logan";
      };
    };
  };
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  systemd.user.services.lock-on-suspend = {
    description = "Lock screen on suspend";
    wantedBy = [ "sleep.target" ];
    serviceConfig.ExecStart = "${pkgs.hyprlock}/bin/hyprlock";
  };

  nix.settings = {
    substituters = lib.mkAfter [ "https://hyprland.cachix.org" ];
    trusted-public-keys = lib.mkAfter [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  #services.greetd = {
  #  enable = true;
  #  settings.default_session = {
  #    command = "Hyprland";
  #    user = "logan";
  #  };
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.logan = {
    isNormalUser = true;
    description = "Logan MacDougall";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
  users.users.greeter = {
    isSystemUser = true;
    description = "Greeter";
    shell = pkgs.bashInteractive;
  };
  users.groups.greeter = {};

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."logan" = import ./home.nix;
  };

  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.segger-jlink.acceptLicense = true;

  environment.variables = {
    XCURSOR_SIZE = "24"; 
 };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  # List services that you want to enable:
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.blueman.enable = true;

  services.udev.extraRules = ''
    # ST-Link/V2
    SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="3748", MODE="0666", GROUP="plugdev"
    # ST-Link/V2-1
    SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="374b", MODE="0666", GROUP="plugdev"
    # ST-Link/V3
    SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="374d", MODE="0666", GROUP="plugdev"
  '';
  services.udev.packages = [ pkgs.segger-jlink-headless ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
