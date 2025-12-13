
local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities())


local attach_hook = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>Telescope lsp_definitions<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gc', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    --vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

vim.lsp.config("clangd", {
    on_attach = attach_hook,
    capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.config("rust_analyzer", {
    on_attach = attach_hook,
    capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("pyright", {
    on_attach = attach_hook,
    capabilities = capabilities
})
vim.lsp.enable("pyright")

vim.lsp.config("hls", {
    on_attach = attach_hook,
    capabilities = capabilities,
})
vim.lsp.enable("hls")

require("tiny-inline-diagnostic").setup()
vim.diagnostic.config { virtual_text = false }

