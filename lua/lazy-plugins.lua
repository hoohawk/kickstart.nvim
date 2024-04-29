-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup(
  {
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    -- NOTE: Plugins can also be added by using a table,
    -- with the first argument being the link and the following
    -- keys can be used to configure plugin behavior/loading/etc.
    --
    -- Use `opts = {}` to force a plugin to be loaded.
    --
    --  This is equivalent to:
    --    require('Comment').setup({})

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Here is a more advanced example where we pass configuration
    -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
    --    require('gitsigns').setup({ ... })
    --
    -- See `:help gitsigns` to understand what the configuration keys do
    -- { -- Adds git related signs to the gutter, as well as utilities for managing changes
    --   'lewis6991/gitsigns.nvim',
    --   opts = {
    --     signs = {
    --       add = { text = '+' },
    --       change = { text = '~' },
    --       delete = { text = '_' },
    --       topdelete = { text = '‾' },
    --       changedelete = { text = '~' },
    --     },
    --   },
    -- },
    -- THIS IS replaced by kickstart.plugins.gitsigns

    -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
    --
    -- This is often very useful to both group configuration, as well as handle
    -- lazy loading plugins that don't need to be loaded immediately at startup.
    --
    -- For example, in the following configuration, we use:
    --  event = 'VimEnter'
    --
    -- which loads which-key before all the UI elements are loaded. Events can be
    -- normal autocommands events (`:help autocmd-events`).
    --
    -- Then, because we use the `config` key, the configuration only runs
    -- after the plugin has been loaded:
    --  config = function() ... end

    require 'kickstart.plugins.which-key',

    -- NOTE: Plugins can specify dependencies.
    --
    -- The dependencies are proper plugin specifications as well - anything
    -- you do for a plugin at the top level, you can do for a dependency.
    --
    -- Use the `dependencies` key to specify the dependencies of a particular plugin

    require 'kickstart.plugins.telescope',

    require 'kickstart.plugins.lsp',

    require 'kickstart.plugins.conform',

    require 'kickstart.plugins.nvim-cmp',

    require 'kickstart.plugins.tokyonight',

    require 'kickstart.plugins.mini',

    require 'kickstart.plugins.treesitter',

    require 'kickstart.plugins.fidget',

    require 'kickstart.plugins.todo-comments',

    -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    require 'kickstart.plugins.debug',

    require 'kickstart.plugins.indent-blankline',

    require 'kickstart.plugins.lint',

    require 'kickstart.plugins.autopairs',

    require 'kickstart.plugins.neo-tree',

    require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

    require 'kickstart.plugins.flash',

    require 'kickstart.plugins.hop', -- prefer to use hop for line jumps (large screen, flash exhausts labels)

    require 'kickstart.plugins.argtextobj',

    require 'kickstart.plugins.code-action-menu',

    require 'kickstart.plugins.alpha-nvim',

    require 'kickstart.plugins.gitlinker',

    require 'kickstart.plugins.tmux-navigator',

    require 'kickstart.plugins.nvim-treesitter-context',

    require 'kickstart.plugins.trouble',

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    --    This is the easiest way to modularize your config.
    --
    --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
    --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
    -- { import = 'custom.plugins' },
  },
  -- use the following for lazy configurations: https://github.com/folke/lazy.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      },
    },
  }
)
