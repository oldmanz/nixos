{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.ssh.enable = 
        lib.mkEnableOption "enables ssh";
    };

    config = lib.mkIf config.z.ssh.enable {

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.openssh.enable = true;
    };
}
