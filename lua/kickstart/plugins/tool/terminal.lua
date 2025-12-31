return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      win = {
        style = 'terminal',
        wo = {
          winblend = 0,
          winfixwidth = false,
        },
      },
    },
  },
  keys = {
    -- Terminal resize keymaps (Shift + arrow keys, 2x speed)
    { '<S-Left>', '<C-\\><C-n>2<C-w><i', mode = 't', desc = 'Shrink terminal width' },
    { '<S-Right>', '<C-\\><C-n>2<C-w>>i', mode = 't', desc = 'Enlarge terminal width' },
    { '<S-Up>', '<C-\\><C-n>2<C-w>+i', mode = 't', desc = 'Increase terminal height' },
    { '<S-Down>', '<C-\\><C-n>2<C-w>-i', mode = 't', desc = 'Decrease terminal height' },
    -- Terminal navigation
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', mode = 't', desc = 'Navigate left' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', mode = 't', desc = 'Navigate down' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', mode = 't', desc = 'Navigate up' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', mode = 't', desc = 'Navigate right' },
  },
}