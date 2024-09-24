{
  description = "Nico Swan";

  inputs = {

    nicoswan.url = "github:nico-swan-com/nixpkgs";

    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";

    # MacOS packages
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # User packages
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self
    , nixpkgs
    , nix-darwin
    , nicoswan
    , home-manager
    , ...
    } @inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs) lib;
      #mkSystem = nicoswan.mkSystem; 
      mkSystem = nicoswan.mkSystem {
        inherit nixpkgs inputs outputs lib nix-darwin home-manager;    
      };
    in
    {
      darwinConfigurations.darwin = mkSystem "darwin" {
        system = "aarch64-darwin"; 
        username = "nicoswan";
        fullname = "Nico Swan";
        email = "hi@nicoswan.com";
        locale = "en_ZA.UTF-8";
        timezone = "Africa/Johannesburg";
        darwin = true;
      };

      nixosConfigurations.nixos = mkSystem "nixos" {
        system = "x86_64-linux"; 
        username = "nicoswan";
        fullname = "Nico Swan";
        email = "hi@nicoswan.com";
        locale = "en_ZA.UTF-8";
        timezone = "Africa/Johannesburg";
        darwin = false;
      };  
    };
          
}
