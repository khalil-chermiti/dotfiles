local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

-- ********** lsp zero config **********

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'jsonls',
})

-- set auto completion for json using schema plugin
require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

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
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  -- vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)

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

lsp.setup()

-- setting up cmp
cmp.setup({

  window = {
    completion = {
      winhighlight = "Normal:CmpNormal,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      winhighlight = "Normal:CmpDocNormal",
    }
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)

      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- needed to enable luasnip
    { name = 'buffer' },
    { name = 'path' },
  },

  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
})
