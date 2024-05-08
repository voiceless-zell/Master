{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.waybar;
in{

  options.modules.waybar = { enable = mkEnableOption "waybar"; };
  config = mkIf cfg.enable {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
     target = "hyprland-session.target";
    };
  };
#  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
#    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
#  });
  };
}
