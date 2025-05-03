{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.home.impermanence.enable = 
        lib.mkEnableOption "enables homeImpermanence";
    };

    config = lib.mkIf config.z.home.impermanence.enable {

   home.persistence."/persist/home/oldmanz" = {
    directories = [
       "nixos"
       "Downloads"
       "Music"
       "Pictures"
       "Documents"
       "Videos"
       "VirtualBox VMs"
       ".gnupg"
       ".ssh"
       ".nixops"
       ".local/share/keyrings"
       ".local/share/direnv"
       ".vscode"
       {
         directory = ".local/share/Steam";
         method = "symlink";
       }
     ];
     files = [
       ".screenrc"
       ".bash_history"
     ];
     allowOther = true;
   };
    };
}
