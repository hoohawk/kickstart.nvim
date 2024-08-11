return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      preset = 'classic',
      sort = { 'desc' },
      icons = {
        mappings = false,
      },
    }

    -- Document existing key chains
    require('which-key').add {
      { '<leader>f', group = 'Find' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>q', group = 'Quit/Session' },
      { '<leader>w', group = 'Window' },
    }
    -- normal and visual mode
    require('which-key').add {
      mode = { 'n', 'v' },
      { '<leader>s', group = 'Surround' },
      { '<leader>g', group = 'Git' },
      { '<leader>t', group = 'Func Toggle' },
      { '<leader>l', group = 'LSP' },
    }
  end,
}
