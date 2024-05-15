{ config, lib, ... }:
with lib;
let
  cfg = config.modules.waybarstyle;
in{

  options.modules.waybarstyle = { enable = mkEnableOption "waybarstyle"; };
  config = mkIf cfg.enable {
  programs.waybar.style = ''

    /*
*
* Base16 Tokyo City Terminal Dark
* Author: Michaël Ball
*
*/

@define-color base00 #171d23;
@define-color base01 #1d252c;
@define-color base02 #28323a;
@define-color base03 #526270;
@define-color base04 #b7c5d3;
@define-color base05 #d8e2ec;
@define-color base06 #f6f6f8;
@define-color base07 #fbfbfd;
@define-color base08 #d95468;
@define-color base09 #ff9e64;
@define-color base0A #ebbf83;
@define-color base0B #8bd49c;
@define-color base0C #70e1e8;
@define-color base0D #539afc;
@define-color base0E #b62d65;
@define-color base0F #dd9d82;
    * {
        font-weight: normal;
        font-size: 14px;
        min-height: 0;
        transition-property: background-color;
        transition-duration: 0.5s;
    }

    window#waybar {
        background-color: @base00;
    }

    window>box {
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 1px;
        border: 2px solid ;
        border-radius: 0px;
        background-color: @base00;
    }

    #workspaces {
        padding-left: 0px;
        padding-right: 4px;
        border-radius: 0px;
    }

    #workspaces button {
        padding-top: 5px;
        border-radius: 0px;
        padding-bottom: 5px;
        padding-left: 8px;
        padding-right: 8px;
    }

    tooltip {
        background: @base01;
    }

    tooltip label {
        color: rgb(217, 224, 238);
    }

    #custom-launcher {
        font-size: 16px;
        padding-left: 10px;
        padding-right: 6px;
        color: #6896BA;
    }

    #clock,
    #memory,
    #temperature,
    #cpu,
    #mpd,
    #custom-wall,
    #temperature,
    #backlight,
    #pulseaudio,
    #network,
    #battery,
    #disk,
    #idle_inhibitor {
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 0px;
        padding-bottom: 0px;
        color: #B9B9B9;
    }
    #cava {
      padding-left: 10px;
      padding-right: 10px;
    }
    #tray {
        padding-right: 8px;
        padding-left: 10px;
    }
  '';
  };
}
