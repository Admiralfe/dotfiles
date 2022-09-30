require("nvim-lsp-installer").setup({
    -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    automatic_installation = false,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities())


local attach_hook = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
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

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    on_attach = attach_hook,
    capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
    on_attach = attach_hook,
    capabilities = capabilities,
}
lspconfig.pyright.setup {
    on_attach = attach_hook,
    capabilities = capabilities,
}
lspconfig.hls.setup {
    on_attach = attach_hook,
    capabilities = capabilities,
}


