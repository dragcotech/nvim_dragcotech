return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Useful status updates for LSP
        'j-hui/fidget.nvim',
    },

    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = { "pyright", "denols", "lua_ls", "ts_ls", "rust_analyzer", "svelte", "html", "cssls", "tailwindcss" },
            automatic_installation = true,
        })

        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config
        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        lspconfig.denols.setup({
            on_attach = on_attach,
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        })
        lspconfig.ts_ls.setup({
            on_attach = on_attach,
            root_dir = lspconfig.util.root_pattern("package.json"),
            single_file_support = false
        })
        lspconfig.cssls.setup({})
        lspconfig.html.setup({})
        lspconfig.rust_analyzer.setup({})
        lspconfig.pyright.setup({})
        lspconfig.svelte.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
        lspconfig.tailwindcss.setup({
            filetypes = {
                "html",
                "css",
                "javascriptreact",
                "typescriptreact",
                "svelte",
                "python"
            },
        })

        require("fidget").setup({})

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].tabstop = 4
                vim.bo[ev.buf].shiftwidth = 4
                vim.bo[ev.buf].expandtab = true
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)

                -- auto format
                if ev.data and vim.lsp.get_client_by_id(ev.data.client_id).server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup('AutoFormatOnSave', { clear = false }),
                        buffer = ev.buf,
                        callback = function()
                            local filetype = vim.bo[ev.buf].filetype
                            -- if filetype == "html" then
                            --     return
                            -- end
                            -- If it have <pre>/<code>, format code
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })

        -- display diagnostics at point
        vim.o.updatetime = 250
        vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
    end,
}
