-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
-- plugins.lua
vim.g.mapleader = " "

local plugins = {

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"3rd/image.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-lua/popup.nvim",
		},
	},

	-- Rose Pine Theme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Harpoon
	{
		"theprimeagen/harpoon",
	},

	-- Undotree
	{
		"mbbill/undotree",
	},

	-- Fugitive
	{
		"tpope/vim-fugitive",
	}, -- image preview
	{
		"3rd/image.nvim",
	},
	--preview in netrw
	{

		"nvim-tree/nvim-web-devicons",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"karb94/neoscroll.nvim",
	},
	{
		"nvim-java/nvim-java",
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		opts = function()
			-- Minimal package definition, leaving most configuration to the logic file
			return {}
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"nvim-lua/plenary.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"nomnivore/ollama.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

require("lazy").setup(plugins, {})
