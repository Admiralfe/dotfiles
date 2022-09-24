vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "EdenEast/nightfox.nvim"
    
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    use { "nvim-telescope/telescope.nvim",
          requires = {{"nvim-lua/plenary.nvim"}}}

    -- Compiled fuzzy finder
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    use "simrat39/rust-tools.nvim"
end)
