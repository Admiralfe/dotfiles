vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.mouse = a

vim.opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = '-'

--Match trailing whitespace
vim.cmd([[match DiffDelete /\s\+$/]])

require("plugins")

local luasnip = require("luasnip")

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
    mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible()  then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i","s"}),
    },
})

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

