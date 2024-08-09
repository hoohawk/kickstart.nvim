return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  enabled = true,
  opts = { mode = 'cursor', max_lines = 3 },
  keys = {
    {
      '<leader>ts',
      '<cmd>TSContextToggle<cr>',
      desc = '[T]ggle Tree[s]tter Code Context',
    },
  },
}
