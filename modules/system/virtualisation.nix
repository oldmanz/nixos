{ pkgs, lib, config, inputs, ... }: {

    options = {
        z.virtualisation.enable = 
            lib.mkEnableOption "enables virtualisation";
    };

    config = lib.mkIf config.z.virtualisation.enable {

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