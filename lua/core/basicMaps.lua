-- Atalho para ':close'
vim.api.nvim_set_keymap('n', '<Esc>', ':close<CR>', { noremap = true, silent = true })

-- Ataho para ':q!'
vim.api.nvim_set_keymap('n', '<S-q>', ':q!<CR>', { noremap = true, silent = true })

-- Atalho para ':e.'
vim.api.nvim_set_keymap('n', '<S-e>', '[[:w<CR> :e %:p:h/<CR>]]', { noremap = true, silent = true })

--vim.api.nvim_set_keymap('n', '<C-S-r>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', "<C-S-r>", require('telescope.builtin').find_files, {})

--vim.api.nvim_set_keymap('n', '<C-S-f>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', "<C-S-f>", require('telescope.builtin').live_grep, {})
