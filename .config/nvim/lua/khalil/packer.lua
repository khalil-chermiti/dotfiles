vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- ***** vim *****

    -- nvim-tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    -- bufferline
    use {
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = 'nvim-tree/nvim-web-devicons'
    }

    -- lualine	
    use 'nvim-lualine/lualine.nvim'

    -- wilder
    use 'gelguy/wilder.nvim'


    -- vim marks
    use "chentoast/marks.nvim"

    -- pane navigation integration with tmux
    use "christoomey/vim-tmux-navigator"

    -- which key
    use "folke/which-key.nvim"

    -- vim surround
    use "tpope/vim-surround"





    -- ***** utils *****

    -- toggle-term
    use "akinsho/toggleterm.nvim"

    -- telescope for nvim
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- neorg
    use {
      "nvim-neorg/neorg",
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim",
    }





    -- **** UI ****

    -- catppuccino theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- one dark pro theme
    use "olimorris/onedarkpro.nvim"

    -- trueZen viewer
    use "Pocco81/true-zen.nvim"

    -- twilight
    use "folke/twilight.nvim"

    -- Buffer delete but keeps layout intact
    use 'famiu/bufdelete.nvim'

    -- ui
    use 'stevearc/dressing.nvim'




    -- ***** code , completion , formatting , linting , etc *****

    -- lsp
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-path' },     -- Optional
        { 'hrsh7th/cmp-buffer' },   -- Optional
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
      }
    }

    -- metals for scala
    use({
      "scalameta/nvim-metals",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })

    -- schemastore for json completion
    use "b0o/schemastore.nvim"

    -- lsp for vscode like code completion
    use "onsails/lspkind.nvim"

    -- needed to enable luasnip snippets
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- tree-sitter
    use(
      'nvim-treesitter/nvim-treesitter',
      { run = ':TSUpdate' }
    )

    -- formatting
    use "stevearc/conform.nvim"

    -- linting
    use "mfussenegger/nvim-lint"

    -- autotags
    use "windwp/nvim-ts-autotag"

    -- vim pairs
    use "windwp/nvim-autopairs"

    -- lunarvim commenting plugin
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- rainbow parentheses
    use "HiPhish/nvim-ts-rainbow2"

    -- indent lines
    use "lukas-reineke/indent-blankline.nvim"

    -- css colors
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end
    }





    -- ***** Git *****

    -- neogit
    use {
      "NeogitOrg/neogit",
      requires = {
        "nvim-lua/plenary.nvim",         -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim",        -- optional
      }
    }

    -- fugitive
    use "tpope/vim-fugitive"

    -- git blame
    use "f-person/git-blame.nvim"

    -- git signs
    use "lewis6991/gitsigns.nvim"


  end,

  config = {
    open_fn = require('packer.util').float,
    display = {
    }
  }
})
