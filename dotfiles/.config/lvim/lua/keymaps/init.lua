-- Configure which-key plugin keymaps
require "keymaps.which-key"

-- dap keymaps
vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
