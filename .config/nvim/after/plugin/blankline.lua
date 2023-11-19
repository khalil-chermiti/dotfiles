-- require("ibl").setup {
--   filetype_exclude = {
--     "help",
--     "terminal",
--     "lspinfo",
--     "TelescopePrompt",
--     "TelescopeResults",
--     "mason",
--     "packer",
--     "",
--   },
--   buftype_exclude = { "terminal" },
--   show_trailing_blankline_indent = false,
--   show_first_indent_level = true,
--
--   show_current_context = true,
--   show_current_context_start = false,
--
--   space_char_blankline = " ",
--   char = "▎",
--   context_char = "▎"
-- }

-- migrating to version 3
require("ibl").setup({
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "packer",
      "dashboard"
    }
  }
})
