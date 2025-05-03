{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.home.git.enable = 
        lib.mkEnableOption "enables git";
    };

    config = lib.mkIf config.z.home.git.enable {

  programs = {
      git = {
        enable = true;
	      userName  = "oldmanz";
	      userEmail = "travis@oldmanz.com";
	      extraConfig = {
	        user = {
            signingkey = "78FA7117E5E1A5D6980C18FB0E46772539892CBC";
	        };
          #commit = {
          #  gpgsign = true;
          #};
	      };
	    };
	};
    };
}
