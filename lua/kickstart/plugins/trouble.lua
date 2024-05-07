return {
  'folke/trouble.nvim',
  branch = 'dev', -- IMPORTANT! v3 beta
  event = 'VeryLazy',
  keys = {
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics - all buff',
    },
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Diagnostics - current buf',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (outline)',
    },
    {
      '<leader>xS',
      '<cmd>Trouble lsp_document_symbols toggle focus=false<cr>',
      desc = 'Symbols',
    },
    {
      '<leader>xa',
      -- '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      '<cmd>Trouble lsp toggle focus=false<cr>',
      desc = 'LSP Def / ref / [A]ll...',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List',
    },
    {
      '<leader>xr',
      '<cmd>Trouble lsp_references toggle<cr>',
      desc = 'References',
    },
    {
      '<leader>xd',
      '<cmd>Trouble lsp_definitions toggle<cr>',
      desc = 'Definitions',
    },
    {
      '<leader>xD',
      '<cmd>Trouble lsp_declarations toggle<cr>',
      desc = 'Declarations',
    },
    {
      '<leader>xi',
      '<cmd>Trouble lsp_implementations toggle<cr>',
      desc = 'Implementations',
    },
    {
      '<leader>xt',
      '<cmd>Trouble lsp_type_definitions toggle<cr>',
      desc = 'Type definitions',
    },
  },
  -- opts = {}, -- for default options, refer to the configuration section for custom setup.
  config = function()
    require('trouble').setup()
    -- works better with transparent plugin
    require('transparent').clear_prefix 'Trouble'
  end,
}
