local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.termguicolors = true

local plugins = {

	-- ***** vim *****

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- lualine
	"nvim-lualine/lualine.nvim",

	-- vim marks
	"chentoast/marks.nvim",

	-- pane navigation integration with tmux
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
		lazy = false,
	},

	-- which key
	"folke/which-key.nvim",

	-- vim surround
	"tpope/vim-surround",

	-- ***** utils *****

	-- toggle-term
	"akinsho/toggleterm.nvim",

	-- neorg
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = "nvim-lua/plenary.nvim",
		version = "^7",
	},

	-- **** UI ****

	-- github colorscheme
	"projekt0n/github-nvim-theme",

	-- trouble
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- one dark pro theme
	"olimorris/onedarkpro.nvim",

	-- trueZen viewer
	"Pocco81/true-zen.nvim",

	-- twilight
	"folke/twilight.nvim",

	-- Buffer delete but keeps layout intact
	"famiu/bufdelete.nvim",

	-- ui
	"stevearc/dressing.nvim",

	-- ***** code , completion , formatting , linting , etc *****

	-- lsp
	{ "VonHeikemen/lsp-zero.nvim" },
	{ "neovim/nvim-lspconfig" },

	{ "williamboman/mason.nvim", lazy = false },
	{ "williamboman/mason-lspconfig.nvim", lazy = false },

	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },

	-- metals for scala
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- java setup
	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-refactor",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
	},

	-- schemastore for json completion
	"b0o/schemastore.nvim",

	-- lsp for vscode like code completion
	"onsails/lspkind.nvim",

	-- needed to enable luasnip snippets
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- tree-sitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- formatting
	"stevearc/conform.nvim",

	-- linting
	"mfussenegger/nvim-lint",

	-- vim pairs
	"windwp/nvim-autopairs",

	-- vim autoapirs
	"jiangmiao/auto-pairs",

	-- lunarvim commenting plugin
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- rainbow parentheses
	"HiPhish/nvim-ts-rainbow2",

	-- indent lines
	"lukas-reineke/indent-blankline.nvim",

	-- css colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- ***** Git *****

	-- neogit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
	},

	-- fugitive
	"tpope/vim-fugitive",

	-- git blame
	"f-person/git-blame.nvim",

	-- git signs
	"lewis6991/gitsigns.nvim",

	-- noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- copilot
	"github/copilot.vim",
}

require("lazy").setup(plugins, {})
