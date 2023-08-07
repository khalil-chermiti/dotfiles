require("lualine").setup {
  -- disabled_filetypes = { 'packer', 'NVimTree' },
  extensions = {
    "toggleterm",
    "nvim-tree"
  },

  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,

    theme = 'onedark'
  }

}
