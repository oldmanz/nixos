{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.ssh.enable = 
        lib.mkEnableOption "enables ssh";
    };

    config = lib.mkIf config.z.system.ssh.enable {

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.openssh.enable = true;
    };
}
