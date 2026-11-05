-- Fuzzy finder: https://github.com/ibhagwan/fzf-lua
-- Keymaps follow Cyan's: <leader>s… means "search".
return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'FzfLua' },
  opts = {},
  keys = {
    { '<leader>sf', '<cmd>FzfLua files<cr>', desc = 'Files' },
    { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep project' },
    { '<leader><leader>', '<cmd>FzfLua buffers sort_lastused=true<cr>', desc = 'Open buffers' },
    { '<leader>.', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files' },
    { '<leader>s=', '<cmd>FzfLua resume<cr>', desc = 'Resume last search' },
    { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help pages' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Keymaps' },
  },
}
