local Plug = vim.fn['plug#']

-- ============================== --

vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = function() vim.cmd('TSUpdate') end })
Plug('itchyny/lightline.vim')

Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug('junegunn/fzf.vim')

Plug('whonore/Coqtail', { ['for'] = 'coq' })

vim.call('plug#end')

-- ============================== --

require('autocmds')
require('keymaps')
require('options')
require('treesitter')

vim.diagnostic.config({
    signs = false,
    virtual_text = true
})
