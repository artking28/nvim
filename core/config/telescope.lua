local builtin = require('telescope.builtin')
vim.keymap.set('n', "<leader>r", builtin.find_files, {})
vim.keymap.set('n', "<leader>rg", builtin.git_files, {})
vim.keymap.set('n', "<S-f>", function() 
	builtin.grep_string({ search = vim.fn.input("Get ~> ") });
end)