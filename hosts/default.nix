{ nixpkgs, self, inputs,...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    lib = nixpkgs.lib;
  in 
  {
    G14 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules =
       [ (./G14/default.nix)]
    ++ [ ( ./../users/zell.nix)]
#++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
   ;
  }; 
  }
