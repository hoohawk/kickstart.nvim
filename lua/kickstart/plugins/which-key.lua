return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      -- ['<leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = 'LSP', _ = 'which_key_ignore' },
      -- ['<leader>d'] = { name = 'Document', _ = 'which_key_ignore' },
      -- ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = 'Surround', _ = 'which_key_ignore' },
      -- ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = 'Func Toggle', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = 'Trouble', _ = 'which_key_ignore' },
      ['<leader>q'] = { name = 'Quit/Session', _ = 'which_key_ignore' },
      -- ['<leader>u'] = { name = 'UI', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>s'] = { 'Surround' },
      ['<leader>g'] = { 'Git' },
    }, { mode = 'v' })
  end,
}
