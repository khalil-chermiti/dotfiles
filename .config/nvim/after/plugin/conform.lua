local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
  },
  -- format_on_save = {
  --   lsp_fallback = true,
  --   async = false,
  --   timeout_ms = 500,
  -- },
})

-- <leader> fd : format document
vim.keymap.set({ "n", "v" }, "<leader>fd", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "format file/block" })
