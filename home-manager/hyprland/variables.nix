{config, lib, ... }:
with lib;
  let   
    cfg = config.modules.hyprvar;
in
{
  options.modules.hyprvar = { enable = mkEnableOption "hyprvar"; };
  config = mkIf cfg.enable {
  home.sessionVariables = {
    FLAKE = "/home/zell/non-nix-flake/";
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    WLR_DRM_NO_ATOMIC = "1";
   #WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
  #  SDL_VIDEODRIVER = "wayland";
  #  DISABLE_QT5_COMPAT = "0";
  #  ANKI_WAYLAND = "1";
  #  NEO4J_CONF=/home/zell/my_neo4j.conf;
  #  _JAVA_AWT_WM_NONEREPARENTING = "1";
  #  __GL_GSYNC_ALLOWED = "0";
  #  __GL_VRR_ALLOWED = "0";
#   QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #  QT_AUTO_SCREEN_SCALE_FACTOR = "1";
#   QT_QPA_PLATFORM = "wayland";
  #  QT_QPA_PLATFORMTHEME = "qt5ct";
  #  QT_STYLE_OVERRIDE = "kvantum";
#   MOZ_ENABLE_WAYLAND = "1";
#   WLR_BACKEND = "vulkan";
  #  WLR_RENDERER = "vulkan";
 };
  };
}
