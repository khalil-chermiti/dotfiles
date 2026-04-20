require("Comment").setup({})
require("todo-comments").setup({})

require("notify").setup({
	render = "wrapped-compact",
})

vim.notify = require("notify")
