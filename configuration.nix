{ pkgs, ... }:
{ 
  #imports = [ <home-manager/nix-darwin> ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  services.nix-daemon.enable = true;
  system.stateVersion = 5;
  #ids.uids.nixbld = 351dd;

  nicoswan.profiles = {
    enable = true;
  };

}

