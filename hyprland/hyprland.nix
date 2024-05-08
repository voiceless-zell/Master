{ 
  pkgs
, lib
, config
, ...
}:
with lib;
let
cfg = config.modules.hyprland;

in {
  options.modules.hyprland = {enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
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
  ];
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
