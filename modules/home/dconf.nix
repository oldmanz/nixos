{
  "org/gnome/shell" = {
    favorite-apps = [];
    disable-user-extensions = false;
    disabled-extensions = [
    "disabled"
    ];
    enabled-extensions = [
      ##"paperwm@paperwm.github.com"
      "Vitals@CoreCoding.com"
      "space-bar@luchrioh"
    ];
  };

  "org/gnome/shell/extensions/space-bar/behavior" = {
    show-empty-workspaces = false;
  };
  "org/gnome/shell/extensions/space-bar/shortcuts" = {
    enable-activate-workspace-shortcuts = true;
    enable-move-to-workspace-shortcuts = true;
  };

  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    enable-hot-corners = false;
  };

  "org/gnome/desktop/interface" = {
    show-battery-percentage = true;
  };

  "org/gnome/desktop/background" = {
      picture-uri = "/home/oldmanz/nixos/wallpaper.png";
  };
  "org/gnome/desktop/screensaver" = {
      picture-uri = "/home/oldmanz/nixos/wallpaper.png";
};
}