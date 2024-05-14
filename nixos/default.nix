{ config, inputs, nixpkgs, ...}:
{
    imports = [
    ./common/boot.nix
    ./common/networking.nix
    ./common/program.nix
    ./common/steam.nix
    ./common/obsidian.nix
    ./common/pipewire.nix
    ./common/security.nix
    ./common/services.nix
    ./common/system.nix
    ./common/virtualisation.nix
    ./common/wayland.nix
    ];
  }
