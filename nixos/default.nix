{ config, inputs, nixpkgs, ...}:
{
    imports = [
    ./common/boot.nix
    ./common/networking.nix
    ./common/programs.nix
    ];
  }
