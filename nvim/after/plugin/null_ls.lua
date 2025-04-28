local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- JavaScript/TypeScript specific sources
		null_ls.builtins.formatting.prettier.with({
			extra_args = { "--config-precedence", "prefer-file" },
		}),

		--        require("none-ls.diagnostics.eslint_d"),
		null_ls.builtins.formatting.prettier.with({
			extra_args = function(params)
				return params.options
					and params.options.tabSize
					and {
						"--tab-width",
						params.options.tabSize,
					}
			end,
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		require("none-ls.diagnostics.eslint"),
		require("none-ls.diagnostics.cpplint"),
		require("none-ls.formatting.jq"),
		require("none-ls.code_actions.eslint"),
	},
	vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {}),
})
