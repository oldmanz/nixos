{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.vscode.enable = 
        lib.mkEnableOption "enables vscode";
    };

    config = lib.mkIf config.z.vscode.enable {

    environment.systemPackages = with pkgs; [
        vscode.fhs
    ];

    };
}
