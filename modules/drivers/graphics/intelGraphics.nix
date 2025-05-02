{ pkgs, lib, config, ... }: {

  options = {
    z.intelGraphics.enable = 
      lib.mkEnableOption "enables intelGraphics";
  };

  config = lib.mkIf config.z.intelGraphics.enable {
    z.hardwareGraphics.enable = true;
  };

}