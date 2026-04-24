return {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { 'nil' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', '.git' },
}