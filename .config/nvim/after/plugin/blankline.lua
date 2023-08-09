require("indent_blankline").setup {
  filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "packer",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,

  show_current_context = true,
  show_current_context_start = false,

  space_char_blankline = " ",
  char = "▎",
  context_char = "▎"
}
