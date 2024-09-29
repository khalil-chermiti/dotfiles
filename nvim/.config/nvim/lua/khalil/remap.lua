local keymaps = {
	explorer = {
		{ mode = "n", keymap = "<leader>e", action = "<cmd>NvimTreeToggle<cr>", desc = "toggle" },
	},

	buffer = {
		{ mode = "n", keymap = "<leader>bn", action = "<cmd>BufferLineCycleNext<cr>", desc = "buffer next" },
		{ mode = "n", keymap = "<leader>bp", action = "<cmd>BufferLineCyclePrev<cr>", desc = "buffer prev" },
		{ mode = "n", keymap = "<leader>bc", action = "<cmd>BufferLinePick<cr>", desc = "buffer pick" },
		{ mode = "n", keymap = "<leader>c", action = "<cmd>Bdelete<CR>", desc = "buffer close" },
	},

	tabs = {
		{ mode = "n", keymap = "<leader>Tn", action = "<cmd>tabNext<cr>", desc = "next tab" },
		{ mode = "n", keymap = "<leader>Tp", action = "<cmd>tabprevious<cr>", desc = "prev tab" },
		{ mode = "n", keymap = "<leader>Tc", action = "<cmd>tabclose<cr>", desc = "close tab" },
	},

	resize = {
		{ mode = "n", keymap = "<C-up>", action = "<cmd>resize +2<cr>", desc = "h +2" },
		{ mode = "n", keymap = "<C-down>", action = "<cmd>resize -2<cr>", desc = "h -2" },
		{ mode = "n", keymap = "<C-left>", action = "<cmd>vertical resize +2<cr>", desc = "v +2" },
		{ mode = "n", keymap = "<C-right>", action = "<cmd>vertical resize -2<cr>", desc = "v -2" },
	},

	trouble = {
		{
			mode = "n",
			keymap = "<leader>td",
			action = "<cmd>Trouble diagnostics<cr>",
			desc = "diagnostics",
		},
		{
			mode = "n",
			keymap = "<leader>tq",
			action = "<cmd>Trouble quickfix<cr>",
			desc = "quickfix",
		},
		{
			mode = "n",
			keymap = "<leader>tr",
			action = "<cmd>Trouble lsp_references<cr>",
			desc = "references",
		},
		{
			mode = "n",
			keymap = "<leader>ti",
			action = "<cmd>Trouble lsp_implementations<cr>",
			desc = "implementations",
		},
	},

	text = {
		{ mode = "n", keymap = "<A-j>", action = "<cmd>m .+1<cr>==", desc = "line down" },
		{ mode = "n", keymap = "<A-k>", action = "<cmd>m .-2<cr>==", desc = "line up" },
		{ mode = "i", keymap = "<A-j>", action = "<Esc><cmd>m .+1<cr>==gi", desc = "line down" },
		{ mode = "i", keymap = "<A-k>", action = "<Esc><cmd>m .-2<cr>==gi", desc = "line up" },
		{ mode = "v", keymap = "<A-j>", action = ":m'>+<cr>gv=gv", desc = "line down" },
		{ mode = "v", keymap = "<A-k>", action = ":m-2<cr>gv=gv", desc = "line up" },
	},

	true_zen = {
		{ mode = "n", keymap = "<leader>zf", action = "<cmd>TZFocus<cr>", desc = "focus" },
		{ mode = "n", keymap = "<leader>za", action = "<cmd>TZAtaraxis<cr>", desc = "ataraxis" },
		{ mode = "n", keymap = "<leader>zm", action = "<cmd>TZMinimalist<cr>", desc = "minimalist" },
	},

	noice = {
		{ mode = "n", keymap = "<leader>n", action = "<cmd>NoiceDismiss<CR>", desc = "dismiss noice messages" },
	},

	inlay_hints = {
		{
			mode = "n",
			keymap = "<leader>lH",
			action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
			desc = "enable inlay hints",
		},
	},
}

-- save keymaps to env to be used later by whichkey
-- _G.keymaps = keymaps

local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)

-- load keymaps
for _, mapping_group in pairs(keymaps) do
	for _, mapping in pairs(mapping_group) do
		vim.keymap.set(mapping.mode, mapping.keymap, mapping.action)
	end
end

return keymaps
