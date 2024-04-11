require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query",
    "java", "javascript", "typescript",
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- rainbow = {
  --   enable = true,
  --   query = 'rainbow-parens',
  --   strategy = require('ts-rainbow').strategy.global,
  --   extended_mode = false,
  -- }
}
