-- Environment Setup for Mason
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require("mason").setup({})
