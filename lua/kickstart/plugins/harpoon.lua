return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local extensions = require 'harpoon.extensions'

    -- REQUIRED
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    }
    -- REQUIRED

    harpoon:extend(extensions.builtins.navigate_with_number())
    -- vsplit for selected item
    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-s>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })
      end,
    }

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon Files',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- vim.keymap.set('n', '<C-e>', function()
    --   toggle_telescope(harpoon:list())
    -- end, { desc = 'Open harpoon window' })
    vim.keymap.set('n', '<leader>e', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Harpoon Explorer' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon quick menu' })
    vim.keymap.set('n', '<C-m>', function()
      harpoon:list():add()
    end, { desc = 'Harpoon mark' })
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon file 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon file 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon file 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon file 4' })
  end,
  event = 'VeryLazy', -- or any other event you might want to use.
}
