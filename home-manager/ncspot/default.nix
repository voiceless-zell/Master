{ config, lib, ... }:
with lib;
let
  cfg = config.modules.ncspot;
in{

  options.modules.ncspot = { enable = mkEnableOption "ncspot"; };
  config = mkIf cfg.enable {
  programs.ncspot = {
      enable = true;
      settings = {
        shuffle = true;
      gapless = true;
        };
    };
};
}
