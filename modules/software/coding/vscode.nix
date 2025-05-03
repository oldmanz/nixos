{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.vscode.enable = 
        lib.mkEnableOption "enables vscode";
    };

    config = lib.mkIf config.z.vscode.enable {

        programs.nix-ld.enable = true;  ## For ssh remote desktop

        environment.systemPackages = with pkgs; [
            vscode
            (vscode-with-extensions.override {
                vscodeExtensions = with vscode-extensions; [
                bbenoist.nix
                ms-vscode-remote.remote-containers
                ms-vscode-remote.remote-ssh
                jdinhlife.gruvbox
                github.copilot
                github.copilot-chat
                vscodevim.vim
                ];
            })
        ]; 

}   ;
}
