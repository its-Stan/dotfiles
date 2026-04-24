vim.api.nvim_create_autocmd("FileType", {
    pattern = "nix",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "cs", "java",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact"
    },
    callback = function()
        vim.opt_local.colorcolumn = '120'
    end,
})