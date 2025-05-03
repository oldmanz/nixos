{ pkgs, lib, config, inputs, outputs, ... }: {

    options = {
    z.users.enable = 
        lib.mkEnableOption "enables users";
    };

    config = lib.mkIf config.z.users.enable {

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
      "oldmanz" = import ../home/oldmanz;
    };
  };
    };
}
