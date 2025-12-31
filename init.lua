--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- For VSCode
if vim.g.vscode then
  vim.opt.clipboard = 'unnamedplus'

  local vscode = require 'vscode'
  print(vscode.call '_ping')

  vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
      vim.highlight.on_yank {
        higroup = 'IncSearch',
        timeout = 150,
        on_visual = true,
      }
    end,
  })

  -- Updated to use vscode.with_insert pattern
  vim.keymap.set('n', 'gr', function()
    vscode.action 'editor.action.goToReferences'

    -- Set up a one-time autocmd to ensure we're in normal mode after selection
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        vim.cmd 'normal! <Esc>'
        return true -- This ensures the autocmd runs only once
      end,
      once = true,
    })
  end, { silent = true })
  vim.keymap.set('n', 'gm', function()
    vscode.action 'editor.action.codeAction'
  end, { silent = true })

  vim.keymap.set('n', '<leader>lr', function()
    vscode.action 'editor.action.rename'
  end, { silent = true })

  -- Convert all VSCodeNotify calls to vscode.action
  vim.keymap.set('n', '<leader>ff', function()
    -- search files by name
    vscode.action 'workbench.action.quickOpen'
  end, { silent = true })
  vim.keymap.set('n', '<leader>fm', function()
    -- search symbols in current buffer
    vscode.action('workbench.action.quickOpen', { args = { '@:' } })
  end, { silent = true })
  vim.keymap.set('n', '<leader>fg', function()
    -- search symbols in workspace
    vscode.action('workbench.action.quickOpen', { args = { '#' } })
  end, { silent = true })
  vim.keymap.set('n', '<leader>fG', function()
    -- search bar
    vscode.action 'workbench.action.findInFiles'
  end, { silent = true })

  vim.keymap.set('n', '<leader>fw', function()
    local word = vim.fn.expand '<cword>'
    vim.cmd('call VSCodeNotify("workbench.action.findInFiles", { "query": "' .. word .. '" })')
  end, { noremap = true, silent = true, desc = 'Find in files: current word' })

  vim.keymap.set('n', '<leader>gg', function()
    vscode.action 'workbench.view.scm'
  end, { noremap = true, silent = true, desc = 'Git version control' })

  vim.keymap.set('n', '<leader>o', function()
    vscode.action 'outline.focus'
  end, { silent = true })

  vim.keymap.set('n', '<leader>a', function()
    vscode.action 'editor.action.selectAll'
  end, { silent = true })

  vim.keymap.set('n', '\\', function()
    vscode.action 'workbench.files.action.showActiveFileInExplorer'
  end, { silent = true })

  vim.keymap.set('n', '<leader>p', function()
    vscode.action 'workbench.action.showCommands'
  end, { silent = true, desc = 'Open command palette' })

  vim.keymap.set('n', '<leader>we', function()
    vscode.action 'workbench.action.evenEditorWidths'
  end, { silent = true })
  vim.keymap.set('n', '<leader>wm', function()
    vscode.action 'workbench.action.toggleEditorWidths'
  end, { silent = true })

  -- Override :e to not show quick open
  -- Create custom command handler
  vim.api.nvim_create_user_command('E', function(opts)
    local filename = opts.args
    if filename and filename ~= '' then
      vscode.action('workbench.action.files.openFile', { args = { filename } })
    else
      -- Do nothing if no filename
      vim.cmd 'echo "No filename provided"'
    end
  end, { nargs = '?', complete = 'file' })

  -- Remap :e to our custom command
  vim.cmd [[cnoreabbrev e E]]
  vim.cmd [[cnoreabbrev E E]]

  -- For context-aware functionality (experimental)
  -- Define the function in Lua
  _G.is_outline_focused = function()
    return vim.g.vscode and vim.fn.exists 'g:vscode_focused_view' == 1 and vim.g.vscode_focused_view == 'outline'
  end

  -- Define the mappings using Lua with vscode.action
  vim.keymap.set('n', 'zc', function()
    if _G.is_outline_focused() then
      vscode.action 'outline.collapse'
    else
      vscode.action 'editor.fold'
    end
  end, { silent = true, desc = 'Context-aware collapse/fold' })

  vim.keymap.set('n', 'zo', function()
    if _G.is_outline_focused() then
      vscode.action 'outline.expand'
    else
      vscode.action 'editor.unfold'
    end
  end, { silent = true, desc = 'Context-aware expand/unfold' })

  -- import lazy-plugins.lua
  require 'lazy-plugins'

  -- Additional keymaps after plugin setup
  vim.keymap.set('n', 'L', '<cmd>HopLine<cr>', { desc = 'Flash line (by hop)' })

  return
end

-- Set guicursor
vim.opt.guicursor =
  'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- import options.lua
require 'options'

-- import keymaps.lua
require 'keymaps'

-- import autocmd.lua
require 'autocmd'

-- import lazy-plugins.lua
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
