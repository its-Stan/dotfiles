local Plug = vim.fn['plug#']

-- ============================== --

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neovim/nvim-lspconfig')
Plug('rust-lang/rust.vim', { ['for'] = 'rs' })

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')

Plug('itchyny/lightline.vim')
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug('junegunn/fzf.vim')

vim.call('plug#end')

-- ============================== --

require('autocmds')
require('completion')
require('keymaps')
require('options')

vim.diagnostic.config({
    signs = false,
    virtual_text = true
})

vim.lsp.enable({
    'clangd',
    'jdtls',
    'omnisharp',
    'nil_ls',
    'pyright',
    'rust-analyzer',
    'ts_ls',
})
