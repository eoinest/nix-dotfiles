# Language servers: the "brains" Neovim talks to for errors, completion,
# go-to-definition and rename. Neovim starts them in
# nvim/config/lua/ernest/plugins/lsp.lua.
# Modeled on Cyan's modules/features/languages/*.nix (he splits one file per
# language; one file is enough for now).
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TypeScript + JavaScript
    vtsls
    # ESLint, JSON, CSS and HTML: four servers in one package
    vscode-langservers-extracted
    # Tailwind class completion
    tailwindcss-language-server

    # Python: types (basedpyright) and lint/format (ruff)
    basedpyright
    ruff

    # Nix (this repo)
    nil

    # Lua (the Neovim config)
    lua-language-server
  ];
}
