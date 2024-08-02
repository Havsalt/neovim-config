-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- Better file tree
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"
    -- Autopairs
    use "windwp/nvim-autopairs"
    -- LSP
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      --"neovim/nvim-lspconfig.nvim"
    }
    -- Autocomplete and snippets
    use "hrsh7th/nvim-cmp"
    use "L3MON4D3/LuaSnip"
    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.6",
      -- or                            , branch = "0.1.x",
      requires = { {"nvim-lua/plenary.nvim"} }
    })
    use(
      "nvim-treesitter/nvim-treesitter",
      {run = ":TSUpdate"}
    )
    -- Terminal
    use({"akinsho/toggleterm.nvim", tag = "*", config = function()
      require("toggleterm").setup()
    end})
    -- Startup screen
    use({
      "goolord/alpha-nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
      config = function ()
        require"alpha".setup(require"alpha.themes.startify".config)
      end
    })
end)
