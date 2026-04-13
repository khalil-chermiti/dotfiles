local options = { noremap = true }

-- General
vim.keymap.set("i", "jj", "<Esc>", options)

-- Explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "toggle explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "open oil" })

-- Resize
vim.keymap.set("n", "<C-up>", "<cmd>resize +2<cr>", { desc = "h +2" })
vim.keymap.set("n", "<C-down>", "<cmd>resize -2<cr>", { desc = "h -2" })
vim.keymap.set("n", "<C-left>", "<cmd>vertical resize +2<cr>", { desc = "v +2" })
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize -2<cr>", { desc = "v -2" })

-- Text Movement
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "line up" })
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<cr>==gi", { desc = "line down" })
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<cr>==gi", { desc = "line up" })
vim.keymap.set("v", "<A-j>", ":m'>+<cr>gv=gv", { desc = "line down" })
vim.keymap.set("v", "<A-k>", ":m-2<cr>gv=gv", { desc = "line up" })

-- buffer

vim.keymap.set(
	"n",
	"<leader>bn",
	"<cmd>BufferLineCycleNext<cr>",
	{ desc = "buffer next", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>bp",
	"<cmd>BufferLineCyclePrev<cr>",
	{ desc = "buffer prev", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePick<cr>", { desc = "buffer pick", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<CR>", { desc = "buffer close", noremap = true, silent = true })

-- Inlay Hints
vim.keymap.set(
	"n",
	"<leader>lH",
	"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "enable inlay hints" }
)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		local opts = { buffer = event.buf }

		-- Navigation
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)

		-- Actions & Editing
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)

		-- Documentation & Help
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

		-- Diagnostics
		vim.keymap.set("n", "<leader>lm", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>gp", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		vim.keymap.set("n", "<leader>gn", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
	end,
})

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fs", builtin.git_files)

-- trouble
vim.keymap.set("n", "<leader>tr", "<cmd>Trouble lsp_references toggle focus=false<cr>", { desc = "Trouble References" })
vim.keymap.set(
	"n",
	"<leader>ti",
	"<cmd>Trouble lsp_implementations toggle focus=false<cr>",
	{ desc = "Trouble Implementations" }
)
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Diagnostics" })
vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble Quickfix" })

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window Left" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Window Previous" })
