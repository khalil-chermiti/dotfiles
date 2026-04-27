local plugins = {
	-- dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" },

	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },

	-- { src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
	-- { src = "https://github.com/giuxtaposition/blink-cmp-copilot" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
}

vim.pack.add(plugins)
