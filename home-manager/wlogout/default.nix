{ config, lib, ... }:
with lib;
let
  cfg = config.modules.wlogout;
in{

  options.modules.wlogout = { enable = mkEnableOption "wlogout"; };
  config = mkIf cfg.enable {
  xdg.configFile."wlogout".source = ./config;
};
}
