local ok_ts, ts = pcall(require, 'nvim-treesitter')

if ok_ts then
    ts.install({
        'angular',
        'bash',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'gomod',
        'gosum',
        'html',
        'java',
        'javascript',
        'json',
        'nix',
        'pkl',
        'python',
        'rust',
        'toml',
        'tsx',
        'typescript',
        'xml',
        'yaml',
    })
end

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
