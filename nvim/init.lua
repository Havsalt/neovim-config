

-- require "user.packer"
require "user.options"
require "user.keymaps"

-- Enable default color scheme
scheme = "gruvbox"
vim.cmd("colorscheme " .. scheme)

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

