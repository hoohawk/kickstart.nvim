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

    'nvim-tree/nvim-web-devicons',

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

    -- NOTE: Plugins can specify dependencies.
    --
    -- The dependencies are proper plugin specifications as well - anything
    -- you do for a plugin at the top level, you can do for a dependency.
    --
    -- Use the `dependencies` key to specify the dependencies of a particular plugin

    require 'kickstart.plugins.ui.which-key',
    require 'kickstart.plugins.ui.telescope',
    require 'kickstart.plugins.ui.tokyonight',
    -- require 'kickstart.plugins.ui.fidget',
    require 'kickstart.plugins.ui.todo-comments',
    require 'kickstart.plugins.ui.indent-blankline',
    require 'kickstart.plugins.ui.neo-tree',
    require 'kickstart.plugins.ui.flash',
    require 'kickstart.plugins.ui.hop', -- prefer to use hop for line jumps (large screen, flash exhausts labels)
    require 'kickstart.plugins.ui.alpha-nvim',
    require 'kickstart.plugins.ui.noice',
    require 'kickstart.plugins.ui.bufferline',
    require 'kickstart.plugins.ui.transparent',
    require 'kickstart.plugins.ui.scrollbar',
    -- require 'kickstart.plugins.ui.bg',
    require 'kickstart.plugins.ui.harpoon',
    require 'kickstart.plugins.ui.dropbar',
    require 'kickstart.plugins.ui.zen-mode',
    require 'kickstart.plugins.ui.window-picker', -- best to use it with neotree, `w` picker

    require 'kickstart.plugins.ext.mini',
    -- require 'kickstart.plugins.ext.autopairs',  -- use mini.pairs
    require 'kickstart.plugins.ext.argtextobj',
    require 'kickstart.plugins.ext.tmux-navigator',

    require 'kickstart.plugins.lsp.lsp-config',
    require 'kickstart.plugins.lsp.conform',
    require 'kickstart.plugins.lsp.nvim-cmp',
    require 'kickstart.plugins.lsp.treesitter',
    require 'kickstart.plugins.lsp.actions-preview',
    require 'kickstart.plugins.lsp.nvim-treesitter-context',
    require 'kickstart.plugins.lsp.trouble',
    require 'kickstart.plugins.lsp.inc-rename',
    require 'kickstart.plugins.lsp.codeium',
    -- require 'kickstart.plugins.lsp.aerial',  -- favors trouble
    require 'kickstart.plugins.lsp.outline',

    -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    require 'kickstart.plugins.dap.debug',

    require 'kickstart.plugins.tool.toggleterm',
    require 'kickstart.plugins.tool.persistence',
    require 'kickstart.plugins.tool.markdown-preview',
    require 'kickstart.plugins.tool.lazydocker',
    require 'kickstart.plugins.tool.obsidian',

    require 'kickstart.plugins.git.lazygit',
    require 'kickstart.plugins.git.gitsigns', -- adds gitsigns recommend keymaps
    -- require 'kickstart.plugins.git.neogit',  -- similar to fugitive
    require 'kickstart.plugins.git.fugitive',
    require 'kickstart.plugins.git.diffview',
    require 'kickstart.plugins.git.gitlinker',

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
