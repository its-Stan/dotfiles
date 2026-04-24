import child from 'node:child_process'
import fs from 'node:fs/promises'
import os from 'node:os'
import process from 'node:process'

function exit(...message) {
    console.error(...message)
    process.exit(1)
}

if (!process.argv[2]) {
    exit('Usage: node', process.argv[0], '<file_path>')
}

const content = fs
    .readFile(process.argv[2], 'utf-8')
    .catch((err) => exit('Error: failed to read file from provided file path', err.message))

const exp = /\s+(?:const|let|var|class|interface|type|enum|(?:(?:default\s+)?(?:(?:async\s+)?function|class))|default)\s+([A-Za-z0-9_$]+)/
const exp_object = /\s*\{\s*([^}]+)\s*\}/
const exp_object_ident = /([A-Za-z0-9_$]+)(?:\s+as\s+([A-Za-z0-9_$]+))?/

function find_exports(content) {
    const exports = new Set()
    const export_len = "export".length

    for (let next = content.indexOf("export"); next !== -1; next = content.indexOf("export")) {
        content = content.slice(next + export_len)
        const exp_match = content.match(exp)

        if (exp_match) {
            exports.add(exp_match[1])
            continue
        }

        const exp_object_match = content.match(exp_object)

        if (exp_object_match) {
            for (const exp_expr of exp_object_match[1].split(',')) {
                const exp_ident = exp_expr.trim().match(exp_object_ident)
                if (exp_ident) exports.add(exp_ident[2] || exp_ident[1])
            }
        }
    }

    return exports
}

const exports = [...find_exports(await content)]
    .filter(exp_ident => !!exp_ident)
    .join(', ')

function spawn_clipboard(clipboard_cmd) {
    return new Promise((resolve, reject) => {
        const child_process = child.spawn(clipboard_cmd, {
            stdio: ['pipe', 'ignore', 'ignore']
        })

        child_process.stdin.write(exports)
        child_process.stdin.end()

        child_process.on('close', (code) => code === 0 ? resolve() : reject())
        child_process.on('error', () => reject())
    });
}

switch (os.platform()) {
    case 'darwin':
        await spawn_clipboard('pbcopy')
    case 'win32':
        await spawn_clipboard('clip')
    default:
        await Promise.any([
            spawn_clipboard('wl-copy'),
            spawn_clipboard('xclip -i -selection clipboard'),
            spawn_clipboard('xsel -ib')
        ])
}