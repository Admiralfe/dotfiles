vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = '-'

require("plugins")
require("lsp_setup")

vim.cmd [[colorscheme terafox]]

require("nvim-treesitter.configs").setup{
    ensure_installed = { "c", "cpp", "lua", "rust", "python" },
    highlight = {
        enable = true,
    },
}

require("telescope").setup{}
require("telescope").load_extension("fzf")

local opts = { noremap = true, silent = true, }
vim.api.nvim_set_keymap('n', "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

