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
	"christoomey/vim-tmux-navigator",

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

	-- vimtex
	-- https://github.com/gkapfham/dotfiles/blob/master/nvim/lua/plugins/vimtex.lua
	{
		"lervag/vimtex",
		init = function()
			vim.cmd([[
        autocmd BufNewFile,BufRead *.tex set filetype=tex
        " Configure vimtex

        " --> Do not fold
        let g:vimtex_fold_enabled = 0

        " --> Do not open quickfix for warnings
        let g:vimtex_quickfix_open_on_warning = 0

        " --> Do not show the help message
        " let g:vimtex_index_show_help = 0

        " --> Use zathura for the PDF viewer
        " let g:vimtex_view_method = 'sioyek'
        let g:vimtex_view_method = 'zathura'

        " --> Use the nvr program (Neovim-remote)
        "     to facilitate communication between
        "     Neovim and the Zathura PDF viewer
        " let g:vimtex_compiler_progname = 'nvr'
        " Configure the latexmk compiler; especially
        " turning off the callback as this seems to
        " generate error messages when compiling
        " and using the zathura program.
        let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : '',
	          \ 'out_dir' : "build",
            \ 'callback' : 0,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

        let g:vimtex_compiler_latexmk_engines = {
            \ '_'                : '-xelatex',
            \ 'pdfdvi'           : '-pdfdvi',
            \ 'pdfps'            : '-pdfps',
            \ 'pdflatex'         : '-pdf',
            \ 'luatex'           : '-lualatex',
            \ 'lualatex'         : '-lualatex',
            \ 'xelatex'          : '-xelatex',
            \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
            \ 'context (luatex)' : '-pdf -pdflatex=context',
            \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
            \}

        let g:vimtex_compiler_latexrun_engines = {
            "\ '_'                : 'pdflatex',
            \ '_'                : 'xelatex',
            \ 'pdflatex'         : 'pdflatex',
            \ 'lualatex'         : 'lualatex',
            \ 'xelatex'          : 'xelatex',
            \}

        " Silent Compiler Messages
        let g:vimtex_compiler_silent = 1
        " Define mapping to generate and view the table of contents
        " nnoremap <leader>lt :VimtexTocToggle<cr>
        " Define mapping to run a "single-shot" compilation
        " Note that this is especially useful when the LaTeX
        " document requires a long background compilation
        " that is so expensive to always run that if limits
        " the ability to use the text editor interactively
        nnoremap <Space>ll :VimtexCompileSS<cr>
        " Disable syntax highlighting provided by vimtex plugin
        let g:vimtex_syntax_enabled = 0
        " Conceal option
        set conceallevel=1
        let g:tex_conceal='abdmgs'
        " Use tex over plaintex
        let g:tex_flavor = 'tex'
        " Required by the vimtex plugin
        set hidden
        " Use latexindent to break up paragraphs
        " This yields commands like "grip" for formatting with latexindent
        " It is still possible to use commands like "gwip" for paragraph formatting
        " nmap gr <plug>(ChopSentences)
        " xmap gr <plug>(ChopSentences)
        " Pass options to latexindent
        " Note that latexindent will reference the ~/.indentconfig.yaml
        " file which will point to the ~/.chopsentences.yaml file
        " let g:latexindent_options = '-m -r'
        " Do not use a space after the comment string symbol in LaTeX
        augroup latexcomments
          autocmd!
          autocmd FileType tex setlocal commentstring=%%s
        augroup END
      ]])
		end,
	},
}

require("lazy").setup(plugins, {})
