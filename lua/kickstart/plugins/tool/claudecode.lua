return {
  'coder/claudecode.nvim',
  dependencies = {
    {
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
    },
  },
  config = function()
    require('claudecode').setup {
      terminal_cmd = '~/.local/bin/claude',
    }
    -- Terminal resize keymaps (Shift + arrow keys, 2x speed)
    vim.keymap.set('t', '<S-Left>', '<C-\\><C-n>2<C-w><i', { desc = 'Shrink terminal width' })
    vim.keymap.set('t', '<S-Right>', '<C-\\><C-n>2<C-w>>i', { desc = 'Enlarge terminal width' })
    vim.keymap.set('t', '<S-Up>', '<C-\\><C-n>2<C-w>+i', { desc = 'Increase terminal height' })
    vim.keymap.set('t', '<S-Down>', '<C-\\><C-n>2<C-w>-i', { desc = 'Decrease terminal height' })
  end,
  lazy = false,
  keys = {
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    -- Terminal navigation
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Navigate left', mode = 't' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Navigate down', mode = 't' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Navigate up', mode = 't' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Navigate right', mode = 't' },
  },
}
