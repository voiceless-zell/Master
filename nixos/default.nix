{ config, inputs, nixpkgs, ...}:
{
    imports = [
    ./common/boot.nix
    ./common/networking.nix
    ];
  }
