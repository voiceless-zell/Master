{ pkgs, nixpkgs, inputs, config, ... }:
{
  imports = [
  ./../../nixos/common/program.nix
  ];
nixpkgs.config.allowUnfree = true;
 networking = {
    hostName = "WSL";
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.gvfs.enable = true;
  wsl = {
      enable = true;
  };
nixpkgs.hostPlatform = "x86_64-linux";
    }

