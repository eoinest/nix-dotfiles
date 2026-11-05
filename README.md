# nix-dotfiles

My machines, set up with [Nix](https://nixos.org), [nix-darwin](https://github.com/nix-darwin/nix-darwin) and [Home Manager](https://github.com/nix-community/home-manager). Inspired by [chenxin-yan/nix-dotfiles](https://github.com/chenxin-yan/nix-dotfiles).

```
flake.nix          inputs, and the list of machines
modules/darwin.nix macOS system settings (nix-darwin)
modules/home.nix   my packages and user settings (Home Manager)
modules/features/  one file or folder per program (nvim, ghostty, ...)
```

- **Nix** builds packages and keeps them in `/nix/store`.
- **nix-darwin** manages macOS-level settings (Dock, keyboard, the Nix daemon).
- **Home Manager** manages my user: packages in `home.packages`, and later dotfiles.

## Set up a new Mac

1. Install Nix (see https://nixos.org/download), then open a new terminal:
   ```sh
   sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
   ```
2. Clone this repo:
   ```sh
   git clone https://github.com/eoinest/nix-dotfiles ~/dev/nix-dotfiles
   cd ~/dev/nix-dotfiles
   ```
3. Add the Mac to `darwinConfigurations` in `flake.nix` (its login name is `whoami`).
4. First switch (installs `darwin-rebuild`):
   ```sh
   sudo nix --extra-experimental-features "nix-command flakes" \
     run nix-darwin/master#darwin-rebuild -- switch --flake .#work-macbook
   ```
   If it asks you to rename files like `/etc/zshrc`, do what it says and rerun.

## Everyday use

Edit a file, then apply it:

```sh
sudo darwin-rebuild switch --flake .#work-macbook
```

Update every package to the latest version: `nix flake update`, then switch.
Commit `flake.lock` so every machine gets the same versions.
