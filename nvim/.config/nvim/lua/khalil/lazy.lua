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

	-- oil.vim
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = false,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- lualine
	"nvim-lualine/lualine.nvim",

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

	-- **** UI ****
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

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

	-- Buffer delete but keeps layout intact
	"famiu/bufdelete.nvim",

	-- ui
	"stevearc/dressing.nvim",

	-- catppuccin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- snacks
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},

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

	-- schemastore for json completion
	"b0o/schemastore.nvim",

	-- lsp for vscode like code completion
	"onsails/lspkind.nvim",

	-- "mfussenegger/nvim-jdtls",
	"nvim-java/nvim-java",

	-- needed to enable luasnip snippets
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},

	-- tree-sitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- formatting
	"stevearc/conform.nvim",

	-- linting
	"mfussenegger/nvim-lint",

	-- vim pairs
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	config = function()
	-- 		require("nvim-autopairs").setup({})
	-- 	end,
	-- },

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

	-- lorem
	{
		"derektata/lorem.nvim",
		config = function()
			require("lorem").opts({
				sentenceLength = "medium",
				comma_chance = 0.2,
				max_commas_per_sentence = 2,
			})
		end,
	},

	-- css colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- git blame
	"f-person/git-blame.nvim",

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		version = "0.0.1",
	},

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

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	{
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}

require("lazy").setup(plugins, {})
