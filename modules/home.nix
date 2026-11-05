# Your user's programs and settings (Home Manager), shared by every machine.
# Not macOS-specific, so a future NixOS Raspberry Pi can reuse it as is.
# Find packages: https://search.nixos.org/packages
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24 # includes npm
    pnpm
    git
    gh
  ];

  # Terminal file manager: run `yazi`, press q to quit.
  # Settings: https://yazi-rs.github.io/docs/configuration/yazi
  programs.yazi.enable = true;

  home.stateVersion = "26.05"; # set once at install; don't change
}
