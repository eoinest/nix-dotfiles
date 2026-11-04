{
  description = "Ernest's machines";

  # Where everything comes from. flake.lock pins the exact versions.
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nix-darwin, home-manager, ... }:
    let
      # Build one Mac from the shared modules. `user` is the macOS login name.
      mkMac = user: nix-darwin.lib.darwinSystem {
        specialArgs = { inherit user; };
        modules = [
          ./modules/darwin.nix
          home-manager.darwinModules.home-manager
          { home-manager.users.${user} = ./modules/home.nix; }
        ];
      };
    in
    {
      # One line per Mac. Apply with: sudo darwin-rebuild switch --flake .#<name>
      darwinConfigurations = {
        work-macbook = mkMac "ernestmccarter";
        # mac-mini = mkMac "<login name>";
        # personal-macbook = mkMac "<login name>";
      };
    };
}
