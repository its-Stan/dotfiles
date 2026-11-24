local keymap = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

keymap('n', '<C-Tab>',   ':bnext<CR>',   default_options)
keymap('n', '<C-&>',     ':bdelete<CR>', default_options)
keymap('n', '<Tab>',     ':Files<CR>',   default_options)
keymap('n', '<M-Tab>',   ':Buffers<CR>', default_options)
keymap('i', '<C-Enter>', '<CR>',         default_options)

keymap('i', '<M-Down>', '<Plug>RocqNext',   default_options)
keymap('i', '<M-Left>', '<Plug>RocqToLine', default_options)
keymap('i', '<M-Up>',   '<Plug>RocqUndo',   default_options)
keymap('n', '<M-Down>', '<Plug>RocqNext',   default_options)
keymap('n', '<M-Left>', '<Plug>RocqToLine', default_options)
keymap('n', '<M-Up>',   '<Plug>RocqUndo',   default_options)
