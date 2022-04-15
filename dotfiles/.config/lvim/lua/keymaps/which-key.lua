-- Which-key: +Sessions
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["B"] = {
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Set Breakpoint",
}
