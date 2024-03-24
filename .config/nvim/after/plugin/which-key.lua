local wk = require("which-key")
wk.setup({
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 2, 1, 2 },
  },
  layout = {
    align = "left",
  },
})
wk.register(
  {
    t = {
      name = "Terminal",
      f = "float",
      h = "horizental",
      v = "vertical"
    },

    T = {
      name = "Tabs",
      p = "prev tab",
      n = "next tab",
      c = "close tab"
    },

    c = "close buffer",

    b = {
      name = "Buffer",
      n = "next",
      p = "previous",
      c = "chose",
    },

    e = {
      name = "Explorer",
      e = "Open",
      f = "Focus",
    },

    l = {
      name = "lsp",
      d = "definition",
      a = "code actions",
      r = "rename",
      R = "references",
      h = "hover",
      f = "format",
      p = "signature help",
      m = "diagnostic",
    },

    f = {
      name = "telescope",
      f = "find files",
      b = "find buffers",
      g = "live grep",
      h = "search help",
      s = "search git"
    },

    z = {
      name = "true zen",
      a = "ataraxis",
      f = "focus",
      m = "minimalist"
    }
  }
  ,
  {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
    expr = false,
  }
)
