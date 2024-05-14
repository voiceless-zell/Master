{ config, inputs, nixpkgs, ...}:
{
    import = [
    ./common/boot.nix
    ./common/networking.nix
    ]
  }
