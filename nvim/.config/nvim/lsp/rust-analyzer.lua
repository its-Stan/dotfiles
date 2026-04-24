return {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },
}
