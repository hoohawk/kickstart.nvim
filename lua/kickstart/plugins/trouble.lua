return {
  'folke/trouble.nvim',
  branch = 'dev', -- IMPORTANT! v3 beta
  event = 'VeryLazy',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>xl',
      -- '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      '<cmd>Trouble lsp toggle focus=false<cr>',
      desc = 'LSP Def / ref / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '<leader>xR',
      '<cmd>Trouble LSP ref toggle<cr>',
      desc = 'References (Trouble)',
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}
