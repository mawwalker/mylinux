local M = {}

M.disabled = {
  n = {
    ["<leader>es"] = "",
  }
}

M.abc = {

  n = {
     ["<C-n>"] = {"<cmd> Telescope <CR>", "Open Telescope"},
     ["<leader>q"] = {"<cmd> q <CR>", "Quit nvim"},
     ["<leader>ww"] = {"<cmd> w <CR>", "Write file"}
  }

}

M.nvimtree = {
   n = {
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
   },
}

M.persistence = {
  n = {
    ["<leader>Ss"] = { "<cmd>lua require('persistence').load()<cr>" , "Store Current directory session"},
    ["<leader>Sl"] = { "<cmd>lua require('persistence').load({ last = true })<cr>" , "Load last"},
    ["<leader>Sd"] = { "<cmd>lua require('persistence').stop()<cr>" , 'quit without session save'},
  }
}

M.dap = {
  n = {
    ["<leader>db"] = { "<cmd> lua require'dap'.toggle_breakpoint()<CR>", "Dap toggle breakpoint" },
    ["<leader>dc"] = {"<cmd> lua require'dap'.continue()<CR>", "Dap continue"},
    ["<leader>dd"] = {"<cmd> lua require'dap'.disconnect()<CR>", "Dap session terminate"},
    ["<F5>"] = {"<cmd> lua require'dap'.continue()<CR>", "Dap continue"},
    ["<F6>"] = { "<cmd> lua require'dap'.toggle_breakpoint()<CR>", "Dap toggle breakpoint" },
    ["<F9>"] = {"<cmd> lua require'dap'.step_over()<CR>", "Dap step_over"},
    ["<F10>"] = {"<cmd> lua require'dap'.step_into()<CR>", "Dap step_into"},
  }
}

return M
