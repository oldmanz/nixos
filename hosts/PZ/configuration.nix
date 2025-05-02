{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/software/default.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  amdGraphics.enable = true;
  systemImpermanence.enable = false;
  nixConfig.enable = true;

  ## Boot Settings
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };

  ## Networking
  networking = {
    hostId = "72439742";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  ## Localization
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  ## Printing
  services.printing.enable = true;

  ## Bluetooth
  services.blueman.enable = true;

  ## SSH and GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.openssh.enable = true;

  ## Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  ## Virtualization
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
  };


  ## Display
  services = {
    xserver = {
      enable = true;
      ## Gnome
      displayManager.gdm.enable = true;
      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverridePackages = [ pkgs.mutter ];
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer']
        '';
      };
      
      ## X11 Keymap 
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };


  ## Shells
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;



  users = {
    users."oldmanz" = {
      isNormalUser = true;
      description = "Travis";
      initialPassword = "Z";
      extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
    };
    extraUsers = {
      root = {
        password = "Z";
      };
    };
  };

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs outputs pkgs;};
    users = {
      "oldmanz" = import ../../modules/home/home.nix;
    };
  };

  system.stateVersion = "24.11";

}