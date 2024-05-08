{ pkgs, lib, config, ... }:
with lib;
let
cfg = config.modules.gtk;
  Tokyo-Night = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Tokyo-Night-GTK-Theme";
    rev = "e9790345a6231cd6001f1356d578883fac52233a";
    hash = "sha256-Q9UnvmX+GpvqSmTwdjU4hsEsYhA887wPqs5pyqbIhmc=";
  };
in
{
  options.modules.gtk = { enable = mkEnableOption "gtk";};
  config = mkIf cfg.enable {
      xdg.dataFile."themes/Tokyo-Night".source = Tokyo-Night;
      gtk = {
      enable = true;
      iconTheme = {
        package = Tokyo-Night;
        name = "Tokyo-Night";
      };
      theme = {
        package = Tokyo-Night;
        name = "Tokyo-Night";
      };
    };
  };
}
