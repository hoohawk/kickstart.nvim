-- flash
-- https://github.com/windwp/nvim-autopairs

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    jump = {
      autojump = false, -- prevent accidental edit, e.g., if there is one match with the partial word, the rest chars can trigger edits (i, dd, ...)
    },
    label = {
      current = false, -- no label for the first match, use <CR> to jump
    },
    rainbow = {
      enabled = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
