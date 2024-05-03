return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  enabled = true,
  opts = { mode = 'cursor', max_lines = 3 },
  keys = {
    {
      '<leader>tt',
      '<cmd>TSContextToggle<cr>',
      desc = 'Toggle Treesitter Code Context',
    },
  },
}
