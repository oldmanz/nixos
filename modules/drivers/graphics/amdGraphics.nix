{ pkgs, lib, config, ... }: {

  options = {
    amdGraphics.enable = 
      lib.mkEnableOption "enables amdGraphics";
  };

  config = lib.mkIf config.amdGraphics.enable {
    hardwareGraphics.enable= true;
  };

}