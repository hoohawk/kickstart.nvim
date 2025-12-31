return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = function()
    require('claudecode').setup {
      terminal_cmd = '~/.local/bin/claude',
      focus_after_send = false,
    }
    -- Terminal resize keymaps (Shift + arrow keys, 2x speed)
    vim.keymap.set('t', '<S-Left>', '<C-\\><C-n>2<C-w><i', { desc = 'Shrink terminal width' })
    vim.keymap.set('t', '<S-Right>', '<C-\\><C-n>2<C-w>>i', { desc = 'Enlarge terminal width' })
    vim.keymap.set('t', '<S-Up>', '<C-\\><C-n>2<C-w>+i', { desc = 'Increase terminal height' })
    vim.keymap.set('t', '<S-Down>', '<C-\\><C-n>2<C-w>-i', { desc = 'Decrease terminal height' })
  end,
  lazy = false,
  keys = {
    { '<leader>aa', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>ac', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },

    -- Add selection
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },

    -- Diff management
    { '<leader>ay', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>an', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
