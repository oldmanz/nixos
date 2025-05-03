{ pkgs, lib, config, inputs, ... }: {

    options = {
        z.system.virtualisation.enable = 
            lib.mkEnableOption "enables virtualisation";
    };

    config = lib.mkIf config.z.system.virtualisation.enable {

          virtualisation = {
            docker.enable = true;
            libvirtd = {
                enable = true;
                onBoot = "ignore";
                onShutdown = "shutdown";
            };
        };
    };
}