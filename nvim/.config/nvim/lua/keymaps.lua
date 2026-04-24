local keymap = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

keymap('n', '<C-Tab>',   ':bnext<CR>',   default_options)
keymap('n', '<C-&>',     ':bdelete<CR>', default_options)
keymap('n', '<Tab>',     ':Files<CR>',   default_options)
keymap('n', '<M-Tab>',   ':Buffers<CR>', default_options)
keymap('i', '<C-Enter>', '<CR>',         default_options)
