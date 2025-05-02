{ pkgs, lib, config, ... }: {

  options = {
    intelGraphics.enable = 
      lib.mkEnableOption "enables intelGraphics";
  };

  config = lib.mkIf config.intelGraphics.enable {
    hardwareGraphics.enable = true;
  };

}