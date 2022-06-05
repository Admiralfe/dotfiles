vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "EdenEast/nightfox.nvim"
    
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    use { "nvim-telescope/telescope.nvim",
          requires = {{"nvim-lua/plenary.nvim"}}}

    -- Compiled fuzzy finder
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    
end)
