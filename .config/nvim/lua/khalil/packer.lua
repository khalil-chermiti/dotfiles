vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope for nvim
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- tree-sitter
    use(
      'nvim-treesitter/nvim-treesitter',
      { run = ':TSUpdate' }
    )

    -- lualine	
    use {
      'nvim-lualine/lualine.nvim',
      -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- wilder
    use { 'gelguy/wilder.nvim' }

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

    -- autotags
    use "windwp/nvim-ts-autotag"

    -- vim pairs
    use { "windwp/nvim-autopairs" }

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
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
      }
    }

    -- java language server
    use "mfussenegger/nvim-jdtls"
    use 'mfussenegger/nvim-dap'
    use 'nvim-lua/plenary.nvim'

    -- needed to enable luasnip snippets
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- git signs
    use "lewis6991/gitsigns.nvim"

    -- toggle-term
    use "akinsho/toggleterm.nvim"

    -- rainbow parentheses
    use "HiPhish/nvim-ts-rainbow2"

    -- one dark pro theme
    use "olimorris/onedarkpro.nvim"

    -- lunarvim commenting plugin
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- pane navigation integration with tmux
    use "christoomey/vim-tmux-navigator"

    -- Buffer delete but keeps layout intact
    use 'famiu/bufdelete.nvim'

    -- ui
    use { 'stevearc/dressing.nvim' }

    -- css colors
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end
    }

    use "lukas-reineke/indent-blankline.nvim"
  end,

  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
