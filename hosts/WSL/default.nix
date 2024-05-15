{ pkgs, nixpkgs, inputs, config, ... }:
{
  imports = [
  ./../../nixos
  ];
nixpkgs.config.allowUnfree = true;
 networking = {
    hostName = "G14";
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.gvfs.enable = true;
}
