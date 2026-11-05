-- Shows a popup of available keybindings as you type: https://github.com/folke/which-key.nvim
-- Press Space and wait a moment to see every <leader> binding.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    -- Names for groups of keys, shown in the popup.
    spec = {
      { '<leader>s', group = 'Search' },
    },
  },
  keys = {
    {
      '<leader>?',
      function() require('which-key').show { global = false } end,
      desc = 'Keymaps for this buffer (which-key)',
    },
  },
}
