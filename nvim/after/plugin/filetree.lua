

local opts = { noremap = true, silent = true }

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  disable_netrw = true,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
})

vim.keymap.set("n", "<leader>".."e", ":NvimTreeToggle<CR>", opts)
