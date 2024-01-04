
local builtin = require('telescope.builtin')

--vim.api.nvim_set_keymap('n', '<C-S-r>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', "<C-S-r>", builtin.find_files, {})

--vim.api.nvim_set_keymap('n', '<C-S-f>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', "<C-S-f>", builtin.live_grep, {})
