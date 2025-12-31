return {
  'christoomey/vim-tmux-navigator',
  cond = not vim.g.vscode,
  init = function()
    -- Disable default mappings, we'll set our own
    vim.g.tmux_navigator_no_mappings = 1
  end,
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    -- Normal mode
    { '<c-h>', '<cmd>TmuxNavigateLeft<cr>', mode = 'n' },
    { '<c-j>', '<cmd>TmuxNavigateDown<cr>', mode = 'n' },
    { '<c-k>', '<cmd>TmuxNavigateUp<cr>', mode = 'n' },
    { '<c-l>', '<cmd>TmuxNavigateRight<cr>', mode = 'n' },
    { '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>', mode = 'n' },
    -- Terminal mode: escape first, then navigate
    { '<c-h>', '<c-\\><c-n><cmd>TmuxNavigateLeft<cr>', mode = 't' },
    { '<c-j>', '<c-\\><c-n><cmd>TmuxNavigateDown<cr>', mode = 't' },
    { '<c-k>', '<c-\\><c-n><cmd>TmuxNavigateUp<cr>', mode = 't' },
    { '<c-l>', '<c-\\><c-n><cmd>TmuxNavigateRight<cr>', mode = 't' },
  },
}
