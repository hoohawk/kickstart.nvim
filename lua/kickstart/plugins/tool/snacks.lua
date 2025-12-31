-- Terminal configuration for snacks.nvim
return {
  'folke/snacks.nvim',
  keys = {
    -- Terminal navigation (tmux-style)
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Navigate left', mode = 't' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Navigate down', mode = 't' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Navigate up', mode = 't' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Navigate right', mode = 't' },
  },
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
}
