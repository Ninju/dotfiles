# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  setup-apple-keyboard = (import <nixpkgs> {}).writeScript "setup-apple-keyboard" ''
    echo Great > /home/alex/.dotfiles/random-file
  '';
in
{
  imports =
    [ # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    ];

  services.autorandr.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # User added: trackpad
  # services.xserver.synaptics.enable = true;
  services.xserver.libinput.naturalScrolling = false;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.middleEmulation = true;
  services.xserver.libinput.tapping = false;

  # User added: keyboard udev rules
  #             ;; This is not working
  services.udev = {
    extraRules = ''
      ACTION=="add", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="0267", RUN+="${setup-apple-keyboard}", OWNER="alex"
    '';
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/London";

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bash
    wget
    vim
    git
    firefox
    htop
    # nur.repos.mic92.inxi
    brightnessctl
    openvpn
  ];

# User added: openvpn - does not work due to auth-user-pass;
#             the vpn.go code is calling GetToken from the auth
#             module, so need to put some time in to understand
#             how that is working.
  services.openvpn.servers = {
    uswitch = { config = '' /home/alex/.openvpn/uswitch.conf ''; };
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_10;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
      '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres' CREATEDB;
      CREATE DATABASE ldn_feeds_dev;
      GRANT ALL PRIVILEGES ON DATABASE ldn_feeds_dev TO postgres;
    '';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [pkgs.gutenprint];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "au";
  # services.xserver.xkbOptions = "eurosign:e";

# User added: i3
  services.xserver.desktopManager.default = "none";
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.extraPackages = with pkgs; [
    i3status
      rofi
      i3lock
      termite
  ];

  hardware.brightnessctl.enable = true;

  services.compton = {
    enable = false;
#    fade = true;
#    inactiveOpacity = "0.9";
#    shadow = true;
#    fadeDelta = 4;
  };

  # User added: session variables
  environment.sessionVariables.TERMINAL = ["termite"];
  environment.sessionVariables.EDITOR = ["vim"];

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  
  # Enable the Gnome Desktop Environment
#   services.xserver.displayManager.gdm.enable = true;
#   services.xserver.desktopManager.gnome3.enable = true;


  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMtO10yeoccljBkl0ZabAm5u3fnDCevDXg9o0V6Dt0gUhbxLU40zjHwQKnu+YIMtWloPluoFornyBUTxIB/hRN4G/sxOO9xoMQRjrGGK4BUQw+aPh34J5GZuQ/ZqFy8KSqT8Qtbo0K77H/5L5fnIRqq6n499z88G4JfmHxiGtBQlbs9arIrj5Qn7Oj/WngOvimxOlCI24Aoi41cYV9hEE0wI/wv3KYtUKQKqvGAmcZwvT40bO2mW+z5Buhj4tglnsPILk3uTxOigz5vhgJp2JfKWSDLDZKFrBx8A5+2grSm+sq5IkO8JVOpZjude1Z6fuLcbVytpAYv3dIW9GGPqMrOZmv7BHQiGXyKJ1z+HsbslNEKPW/U47Yevnsaxy+8ldA4siiQOnwVjZQtidfsyO/06qYxNC6M+IEYq9E9IlFNgRyMIPRIPLEAaH6UusTkjG3uAfbKS44KZmLsRY71iACDh/UcrAF9YRBLj2s6kdGyESkbxEy/NGkKvNOB6VUqXh3femWybpa5K0BZ9ZGTphOFj8W46ijfGLopsDO9Rp1Ri6k8d1NIytUE2zzjORXfzPBEym7bX/x/bR6QnsYmStEE8LoD8SctTFGenqUYYQCv54vNPzJnwVGAjE2NsgU3Haq+6JHpBJYZaGQWKro7nS8jLDB4vc/8qd2wZiJz5501Q== a-alex.watt@rvu.co.uk" ];
    };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
}
