return {
  -- nvim-dap and nvim-dap-ui
  {
    'mfussenegger/nvim-dap',
    cond = not vim.g.vscode,
    keys = {
      { '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", desc = 'Continue' },
      { '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = 'Breakpoint' },
      { '<leader>du', "<cmd>lua require'dapui'.toggle()<cr>", desc = 'DAP UI' },
      { '<leader>ds', "<cmd>lua require'dap'.step_over()<cr>", desc = 'Step Over' },
      { '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", desc = 'Step Into' },
      { '<leader>do', "<cmd>lua require'dap'.step_out()<cr>", desc = 'Step Out' },
    },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'

      -- Automatically open UI when debugging starts
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        -- Keep dap-ui open when debugging ends, comment out
        -- dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        -- Keep dap-ui open when debugging ends, comment out
        -- dapui.close()
      end

      -- Configure UI layout
      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        mappings = {
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 0.3 },
              { id = 'breakpoints', size = 0.2 },
              { id = 'stacks', size = 0.3 },
              { id = 'watches', size = 0.2 },
            },
            size = 40, -- Width of the left panel
            position = 'left',
          },
          {
            elements = {
              { id = 'repl', size = 0.4 }, -- Adds the REPL window
              { id = 'console', size = 0.6 },
            },
            size = 10, -- Height of the bottom panel
            position = 'bottom',
          },
        },
        floating = {
          border = 'rounded',
        },
        windows = { indent = 1 },
      }

      -- Optional: Set virtual text for current frame
      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
  },

  -- nvim-dap-python setup
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    keys = {
      { '<leader>dpm', "<cmd>lua require'dap-python'.test_method()<cr>", desc = 'PY - Test Method' },
      { '<leader>dpc', "<cmd>lua require'dap-python'.test_class()<cr>", desc = 'PY - Test Class' },
    },
    config = function()
      local dap_python = require 'dap-python'
      local function get_poetry_python_path()
        local venv_path = vim.fn.trim(vim.fn.system 'poetry env info --path')
        return venv_path .. '/bin/python'
      end

      -- print the results of poetry python path
      print(get_poetry_python_path())
      dap_python.setup(get_poetry_python_path())
    end,
  },

  -- Neotest and dependencies, TDD
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      -- make sure those were loaded too, lazy may not load them
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
    },
    keys = {
      -- mapping keys as close as possible to neotest default keys (use '?' in the neotest summary window)
      { '<leader>nr', '<cmd>lua require("neotest").run.run()<cr>', desc = 'Run' },
      { '<leader>nu', '<cmd>lua require("neotest").run.run()<cr>', desc = 'Stop' },
      { '<leader>nd', '<cmd>lua require("neotest").run.run({strategy = "dap",  args = { "--no-cov" }})<cr>', desc = 'Debug' },
      { '<leader>nf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = 'Test File' },
      { '<leader>no', '<cmd>Neotest output-panel<cr>', desc = 'Output' },
      { '<leader>ns', '<cmd>lua require("neotest").summary.toggle()<cr>', desc = 'Summary' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
            runner = 'pytest',
          },
        },
      }
    end,
  },
}
