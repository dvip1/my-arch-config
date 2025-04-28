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
		"kotlin_language_server", -- Kotlin support
		"gradle_ls", -- Gradle support
		"ts_ls", -- TypeScript/JavaScript
		"pylsp",
		"eslint", -- ESLint
		"bashls",
		"lua_ls",
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
    ensure_installed = {
        "ast-grep",
    },
    automatic_installation = true,
})

