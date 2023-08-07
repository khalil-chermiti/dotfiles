require 'bufferline'.setup({
  options = {

    style_preset = require("bufferline").style_preset.minimal,
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        separator = false,
        text_align = "center"
      }
    },

    always_show_bufferline = true,
    enforce_regular_tabs = true,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,

    indicator = {
      style = "icon"
    },

    -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
    separator_style = "thing",
    show_close_icon = false,
    show_buffer_close_icons = false,
  },
})
