-- Yazi file manager in a floating window: https://github.com/mikavilpas/yazi.nvim
return {
  'mikavilpas/yazi.nvim',
  keys = {
    { '-', '<cmd>Yazi<cr>', desc = 'Open yazi at the current file' },
    { '<c-e>', '<cmd>Yazi cwd<cr>', desc = "Open yazi in nvim's working directory" },
  },
  opts = {
    integrations = {
      grep_in_directory = 'fzf-lua',
      grep_in_selected_files = 'fzf-lua',
    },
  },
}
