{ 
  pkgs
, lib
, config
, isNixOS
, ...
}:

{
  lib.mkIf config.wayland.windowManager.hyperland.enable {
home.packages = lib.mkIf isNixOS(
    
  home.packages = with pkgs; [
    swww
    hyprpicker
    wofi
    rofi-wayland
    wlogout
    grim
    slurp
    wl-clipboard
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    grimblast
  ]
);
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
      systemd.enable = true;
    enable = true;
    xwayland = {
      enable = true;
    #  hidpi = true;
    };
    #nvidiaPatches = false;
  };
  };
}
