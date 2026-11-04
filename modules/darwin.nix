# macOS system settings (nix-darwin), shared by every Mac.
# Options: https://nix-darwin.github.io/nix-darwin/manual/
{ user, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin"; # Apple Silicon
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.primaryUser = user;
  users.users.${user}.home = "/Users/${user}";

  # Home Manager (modules/home.nix) uses the same packages as the system.
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # macOS tweaks go here, for example:
  # system.defaults.dock.autohide = true;

  system.stateVersion = 6; # set once at install; don't change
}
