-- Define capabilities (add this at the top)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- Mappings
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- TypeScript/JavaScript LSP setup
require('lspconfig').ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    }
}

-- Python LSP setup
require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pyls_mypy = {
                    enabled = true,
                    live_mode = true
                }
            }
        }
    }
}

-- Bash LSP setup
require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    settings = {
        bashIde = {
            globPattern = true,
            shellcheckPath = "shellcheck",
            formatter = {
                enableDefaultFormatter = true
            }
        }
    },
}
-- Lua LSP setup
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- Disable third party checks
            },
            -- Do not send telemetry data
            telemetry = {
                enable = false,
            },
            completion = {
                callSnippet = "Replace" -- More efficient snippet handling
            },
        },
    },
}

