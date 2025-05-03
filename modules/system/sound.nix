{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.sound.enable = 
        lib.mkEnableOption "enables sound";
    };

    config = lib.mkIf config.z.system.sound.enable {

        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };
    };
}
