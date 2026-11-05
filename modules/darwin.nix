# macOS system settings (nix-darwin), shared by every Mac.
# Options: https://nix-darwin.github.io/nix-darwin/manual/
{ host, user, lib, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin"; # Apple Silicon
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.primaryUser = user;
  users.users.${user}.home = "/Users/${user}";

  # Home Manager (modules/home.nix) uses the same packages as the system.
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Keep Homebrew on PATH in every shell, after Nix so Nix's copies win.
  environment.systemPath = lib.mkOrder 1100 [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];

  # `rebuild`: pull this repo, then apply it to this Mac.
  # Set in /etc/zshrc so every terminal gets it, not just login shells.
  programs.zsh.interactiveShellInit = ''
    alias rebuild="/Users/${user}/dev/nix-dotfiles/scripts/utils/switch.sh ${host}"
  '';

  # macOS tweaks go here, for example:
  # system.defaults.dock.autohide = true;

  system.stateVersion = 6; # set once at install; don't change
}
