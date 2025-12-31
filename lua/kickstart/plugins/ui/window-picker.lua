return {
  's1n7ax/nvim-window-picker',
  cond = not vim.g.vscode,
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    require('window-picker').setup {
      hint = 'floating-big-letter',
      filter_rules = {
        -- when there is only one window available to pick from, use that window
        -- without prompting the user to select
        autoselect_one = true,

        -- whether you want to include the window you are currently on to window
        -- selection or not
        include_current_win = false,

        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'NvimTree', 'neo-tree', 'notify', 'noice' },

          -- if the file type is one of following, the window will be ignored
          buftype = { 'terminal' },
        },
      },
    }
    -- Function to pick a window and move cursor to it
    function _G.move_cursor_to_picked_window()
      local picker = require 'window-picker'
      local window_id = picker.pick_window() -- Pick the window

      if window_id then
        vim.api.nvim_set_current_win(window_id) -- Move cursor to the picked window
      end
    end
  end,
  keys = {
    -- Keybinding to call the function
    { '<Leader>ww', '<cmd>lua move_cursor_to_picked_window()<CR>', desc = 'Pick window' },
  },
}
