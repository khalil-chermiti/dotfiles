require("trouble").setup({
	auto_close = false, -- auto close when there are no items
	auto_open = false, -- auto open when there are items
	auto_preview = false, -- automatically open preview when on an item
	auto_refresh = true, -- auto refresh when open
	auto_jump = false, -- auto jump to the item when there's only one
	focus = false, -- Focus the window when opened
	restore = true, -- restores the last location in the list when opening
	follow = false, -- Follow the current item
	indent_guides = false, -- show indent guides
	max_items = 200, -- limit number of items that can be displayed per section
	multiline = false, -- render multi-line messages
	pinned = true, -- When pinned, the opened trouble window will be bound to the current buffer
	open_no_results = true, -- open the trouble window when there are no results
  warn_no_results = true, -- show a warning when there are no results
})
