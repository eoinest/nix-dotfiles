# Neovim, set up like Cyan's: Nix installs the tools, and ~/.config/nvim
# links to ./config, so Lua edits apply on the next nvim start (no rebuild).
# Plugins are managed by lazy.nvim; versions are pinned in config/lazy-lock.json.
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    fzf # fuzzy finder that fzf-lua drives
    ripgrep # rg: text search (FzfLua live_grep)
    fd # file search (FzfLua files)
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dev/nix-dotfiles/modules/nvim/config";
}
