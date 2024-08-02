

local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
vim.keymap.set("n", "<C-l>", builtin.git_files, opts)
vim.keymap.set("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
