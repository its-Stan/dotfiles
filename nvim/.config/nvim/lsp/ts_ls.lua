return {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
}
