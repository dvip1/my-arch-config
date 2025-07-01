require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd", -- C/C++ language server
		"kotlin_language_server", -- Kotlin support
		"gradle_ls", -- Gradle support
		"ts_ls", -- TypeScript/JavaScript
		"pylsp", -- Python
		"eslint", -- ESLint
		"bashls", -- Bash
		"lua_ls", -- Lua
		"gopls", -- Go language server
		"intelephense",
	},
	automatic_installation = true,
})
require("mason-null-ls").setup({
	ensure_installed = {
		"ast-grep",
		"gofumpt", -- Go formatter (stricter than gofmt)
		"golangci-lint", -- Go linter
		"clang-format", -- C/C++ formatter
		"clang-tidy", -- C/C++ linter (alternative to cpplint)
	},
	automatic_installation = true,
})

-- LSP configuration for clangd
