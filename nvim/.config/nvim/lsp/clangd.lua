return {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { 'clangd', '--enable-config' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}
