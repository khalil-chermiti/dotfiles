local plugins = {
  -- dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim"},
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/rcarriga/nvim-notify" },

  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/tpope/vim-surround" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/olimorris/onedarkpro.nvim" },
  { src = "https://github.com/famiu/bufdelete.nvim" },
  { src = "https://github.com/numToStr/Comment.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/f-person/git-blame.nvim" },
  { src = "https://github.com/github/copilot.vim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/folke/noice.nvim" },

  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
  { src = "https://github.com/stevearc/conform.nvim" }
}

vim.pack.add(plugins)

