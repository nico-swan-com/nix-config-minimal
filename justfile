

default:
  @just --list

update: 
   nix flake update --extra-experimental-features nix-command --extra-experimental-features flakes

rebuild: update
   darwin-rebuild switch --flake .#default --show-trace
