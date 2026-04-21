require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

require("copilot").setup({})

require("todo-comments").setup({})

require("notify").setup({
	render = "wrapped-compact",
})

vim.notify = require("notify")
