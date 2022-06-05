local packer_bootstrap = function()
    local install_path = vim.fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
    end 
end

vim.api.nvim_create_user_command(
    "BootstrapPacker",
    packer_bootstrap,
    { nargs = 0 }
)

local init_lsps = function()
    vim.cmd("LspInstall --sync clangd")
    vim.cmd("LspInstall --sync cmake")
    vim.cmd("LspInstall --sync rust-analyzer")
    vim.cmd("LspInstall --sync hls")
    vim.cmd("LspInstall --sync pylsp")
end

vim.api.nvim_create_user_command(
    "InstallDefaultLSP",
    init_lsps,
    { nargs = 0 }
)

