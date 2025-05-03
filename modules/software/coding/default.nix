{ pkgs, lib, config, inputs, ... }: {
    imports = [
        ./vscode.nix
    ];
    options = {
    z.software.coding.enable = 
        lib.mkEnableOption "enables coding";
    };

    config = lib.mkIf config.z.software.coding.enable {
        z.vscode.enable = true;
    };
}
