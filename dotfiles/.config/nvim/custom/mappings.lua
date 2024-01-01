---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { ":qa<CR>", "Quit all", opts = { nowait = true } },
    ["<leader>c"] = { ":bd<CR>", "Close Buffer", opts = { nowait = true } },
    ["<leader>e"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree", opts = { nowait = true } },
    ["<leader>ww"] = { ":w<CR>", "Write", opts = { nowait = true } },
  },
}

-- more keybinds!

M.debug = {
  n = {
     ['<F5>'] = { ":lua require'dap'.continue()<CR>" , "Debug continue"},
     ['<leader>dc'] = { ":lua require'dap'.continue()<CR>" , "Debug continue"},
     ['<F10>'] = { ":lua require'dap'.step_over()<CR>" , "step over"},
     ['<F11>'] = { ":lua require'dap'.step_into()<CR>" , "step into"},
     ['<F12>'] = { ":lua require'dap'.step_out()<CR>" , "step out"},
     ['<leader>B'] = { ":lua require'dap'.toggle_breakpoint()<CR>" , "toggle breakpoint"},
  }
}

M.persistence = {
  n = {
  ['<leader>Sc'] = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  ['<leader>Sl'] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  ['<leader>SQ'] = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" }
  }
}

return M
