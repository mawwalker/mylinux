function get_config(name)
  return string.format('require("user.configs.%s")', name)
end

local config = {

  -- Set colorscheme
  colorscheme = "dracula",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = "none",
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  -- Disable AstroVim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      { 'Mofiqul/dracula.nvim', },
      {"ellisonleao/glow.nvim", branch = 'main'},
      { 'mfussenegger/nvim-dap',
        config = get_config("dap"),
      },
      {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = get_config("dap-ui"),
      },   
      -- {
      --   'glepnir/dashboard-nvim',
      --   event = "BufRead",
      --   config = get_config("dashboard").config,
      -- },


    
    },
    -- default_plugins["glepnir/dashboard-nvim.lua"]["g.dashboard_custom_header"] = "",
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local set = vim.opt
    -- Set options
    set.relativenumber = true

    vim.g.dashboard_custom_header = {
      " ",
      "███████╗███╗   ███╗ █████╗ ██████╗ ████████╗",
      "██╔════╝████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝",
      "███████╗██╔████╔██║███████║██████╔╝   ██║   ",
      "╚════██║██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ",
      "███████║██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ",
      "╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ",
      " ",
      "    ██████╗ ███████╗███╗   ██╗ ██████╗      ",
      "    ██╔══██╗██╔════╝████╗  ██║██╔════╝      ",
      "    ██║  ██║█████╗  ██╔██╗ ██║██║  ███╗     ",
      "    ██║  ██║██╔══╝  ██║╚██╗██║██║   ██║     ",
      "    ██████╔╝███████╗██║ ╚████║╚██████╔╝     ",
      "    ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝      ",
      " ",
    }
    local fn = vim.fn
    local plugins_count = fn.len(vim.fn.globpath(fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))
    vim.g.dashboard_custom_footer = {
      " ",
      " SmartDeng\'s Nvim loaded " .. plugins_count .. " plugins ",
    }
    set.clipboard=unnamedplus
    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)
    -- vim.g.mapleader = ","
    map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
    map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
    map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
    map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
    map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
    map("n", "<leader>r", ":lua require'dap'.repl.open()<CR>", opts)
    map("n", "<leader>u", ":lua require('dapui').toggle()<CR>", opts)
    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  end,
}

return config
