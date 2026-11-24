vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showcmd = false
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.colorcolumn = '80'
vim.opt.shortmess = 'I'
vim.opt.clipboard = 'unnamedplus'

local pkl_bin = vim.fn.expand("~/.local/bin/pkl")

vim.g.c_syntax_for_h = 1
vim.g.pkl_neovim = {
    pkl_cli_path = vim.fn.executable(pkl_bin) and pkl_bin or nil
}
