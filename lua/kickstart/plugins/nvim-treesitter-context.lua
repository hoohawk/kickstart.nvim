return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  enabled = true,
  opts = { mode = 'cursor', max_lines = 3 },
  keys = {
    {
      '<leader>ut',
      '<cmd>TSContextToggle<cr>',
      desc = 'Toggle Treesitter Context',
    },
  },
}
