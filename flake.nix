{
  description = "Home Manager configuration of zell";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
        url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { nixpkgs, home-manager, self, ... }@inputs:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowunfree = true;};
    in {
      nixosConfigurations = (import ./hosts/nixos.nix);

      homeConfigurations = (import ./hosts/home.nix);
     # homeConfigurations."zell" = home-manager.lib.homeManagerConfiguration {
     #   inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
     #   modules = [ ./home.nix 
     #   inputs.hyprland.homeManagerModules.default];

        extraSpecialArgs = {
            isNixOS = false;
          };
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
    # };
    };
}
