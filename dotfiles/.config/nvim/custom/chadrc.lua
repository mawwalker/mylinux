-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
M.mappings = require "custom.mappings"
local pluginConfs = require "custom.plugins.configs"

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
   user = {
      ["goolord/alpha-nvim"] = {
         disable = false,
      },
     ["folke/which-key.nvim"] = {
       disable = false,
     },
     ["folke/persistence.nvim"] = {
       event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
          require("persistence").setup()
        end,
     },
     ["mfussenegger/nvim-dap"] = {pluginConfs.dap()},
     ["rcarriga/nvim-dap-ui"] = {
       requires = {"mfussenegger/nvim-dap"},
       pluginConfs.dapui()
     },
     ["f-person/git-blame.nvim"] = {
        event = "BufRead",
        config = function()
          vim.cmd "highlight default link gitblame SpecialComment"
          vim.g.gitblame_enabled = 0
        end,
     },
     ["p00f/nvim-ts-rainbow"] = {},
   },
}


return M
