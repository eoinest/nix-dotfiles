# Your user's programs and settings (Home Manager), shared by every machine.
# Not macOS-specific, so a future NixOS Raspberry Pi can reuse it as is.
# Find packages: https://search.nixos.org/packages
{ pkgs, ... }:
{
  # One file or folder per program, in modules/features/.
  imports = [
    ./features/nvim
    ./features/ghostty.nix
    ./features/yazi.nix
    ./features/languages.nix
  ];

  home.packages = with pkgs; [
    nodejs_24 # includes npm
    pnpm
    git
    gh
    uv
  ];

  home.stateVersion = "26.05"; # set once at install; don't change
}
