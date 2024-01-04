

-- Atalho para ':close'
vim.api.nvim_set_keymap('n', '<Esc>', ':close<CR>', { noremap = true, silent = true })

-- Ataho para ':q!'
vim.api.nvim_set_keymap('n', '<S-q>', ':q!<CR>', { noremap = true, silent = true })

-- Atalho para ':e.'
vim.api.nvim_set_keymap('n', '<S-e>', '[[:w<CR> :e %:p:h/<CR>]]', { noremap = true, silent = true })
