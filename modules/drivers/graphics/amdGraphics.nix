{ pkgs, lib, config, ... }: {

  options = {
    z.amdGraphics.enable = 
      lib.mkEnableOption "enables amdGraphics";
  };

  config = lib.mkIf config.z.amdGraphics.enable {
    z.hardwareGraphics.enable= true;
  };

}