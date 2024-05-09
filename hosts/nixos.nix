{ inputs, lib, pkgs, specialArgs, ... }:
let
  mkNixosConfiguration = 
  host:
  lib.nixosSystem {
      inherit pkgs;

      specialArgs = {
          inherit host;
          isNixOS = true;
        };
      modules = [
      ./${host}
      ./${host}/hardware.nix
      ../nixos
      ../modules/nixos
      inputs.home-manager.nixos.home-manager
      {
          home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                  inherit host;
                  isNixOS = true;
                };

                users.zell = { 
                    imports = [
                    ./${host}/home.nix
                    ../home-manager
                    ../modules/home-manager
                    ];
                  };
            };
        }
      ];
    };
in
{
G14 = mkNixosConfiguration "G14";
}
