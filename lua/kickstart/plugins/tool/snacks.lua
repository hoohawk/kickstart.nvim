-- Terminal configuration for snacks.nvim
return {
  'folke/snacks.nvim',
  -- NOTE: Terminal navigation handled by vim-tmux-navigator plugin
  keys = {},
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
