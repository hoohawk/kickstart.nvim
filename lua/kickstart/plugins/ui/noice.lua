return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
    -- cmdline = {
    --   view = 'cmdline_popup', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    --   opts = {
    --     position = {
    --       row = '50%',
    --       col = '50%',
    --     },
    --   },
    -- },
    -- popupmenu = {
    --   enabled = true, -- enables the Noice popupmenu UI
    --   ---@type 'nui'|'cmp'
    --   backend = 'nui', -- backend to use to show regular cmdline completions
    --   ---@type NoicePopupmenuItemKind|false
    --   -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    --   kind_icons = {}, -- set to `false` to disable icons
    -- },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      -- use the following customization to move down the unit in the editor window
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
    views = { -- set cmdline_pop custom position, make popupmenu row = popup + 3
      cmdline_popup = {
        position = {
          row = 20,
          col = '50%',
        },
        size = {
          min_width = 60,
          width = 'auto',
          height = 'auto',
        },
      },
      cmdline_popupmenu = {
        relative = 'editor',
        position = {
          row = 23,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
          max_height = 15,
        },
        border = {
          style = 'rounded',
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = 'Normal', FloatBorder = 'NoiceCmdlinePopupBorder' },
        },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- 'rcarriga/nvim-notify',
    -- LSP renaming with immediate visual feedback
    'smjonas/inc-rename.nvim',
  },
}
