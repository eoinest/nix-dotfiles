-- Language servers: https://github.com/neovim/nvim-lspconfig
-- Nix installs the servers (modules/features/languages.nix); this file
-- tells Neovim to start them. nvim-lspconfig supplies each server's settings.
--
-- Built-in keys once a server is running (Neovim 0.11+):
--   K    hover docs        grd  go to definition   grr  references
--   grn  rename            gra  code actions       [d ]d  previous/next error
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- Show errors at the end of the line.
    vim.diagnostic.config { virtual_text = true }

    -- Lua: `vim` is a global in Neovim config files, not a typo.
    vim.lsp.config('lua_ls', {
      settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
    })

    vim.lsp.enable {
      'vtsls', -- TypeScript + JavaScript
      'eslint',
      'jsonls',
      'cssls',
      'html',
      'tailwindcss',
      'basedpyright', -- Python
      'ruff',
      'nil_ls', -- Nix
      'lua_ls',
    }
  end,
}
