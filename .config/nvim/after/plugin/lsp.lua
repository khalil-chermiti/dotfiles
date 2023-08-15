local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

-- ********** lsp zero config **********

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls'
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- auto-complete mapping
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- lsp remap
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", '<leader>lf', function() vim.lsp.buf.format() end, opts)
  vim.keymap.set("n", "<leader>lm", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)

  -- format buffer on save with default formatter
  -- lsp.buffer_autoformat()
end)

-- set sign icons
lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.skip_server_setup({ 'jdtls' })

lsp.setup()

-- setting up cmp
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' } -- needed to enable luasnip
  },
  window = {
    completion = cmp.config.window.bordered({ border = "single" }),
    documentation = cmp.config.window.bordered({ border = "single" })
  },

  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
})
