{ nixpkgs, nixos-hardware, self, inputs, nixos-wsl, ...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system inputs;
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
  # ++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
   ;
  }; 
    T480 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules =
       [ (./T480/default.nix)]
    ++ [ ( ./../users/zell.nix)]
#++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
   ;
  };
    WSL = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs self; };
        modules = 
        [ (./WSL/default.nix)]
     ++ [ (./../users/zell.nix)]
     ++ [ (nixos-wsl.nixosModules.default)]
       ;
      };
    P72 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules =
       [ (./P72/default.nix)]
    ++ [ ( ./../users/zell.nix)]
#++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
   ;
  };
    P16 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules =
       [ (./P16/default.nix)]
    ++ [ ( ./../users/zell.nix)]
#++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
   ;
  };

  }
