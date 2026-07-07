local options = { noremap = true }

-- General
vim.keymap.set("i", "jj", "<Esc>", options)

-- Explorer
vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "open oil" })

-- Inlay Hints
vim.api.nvim_create_autocmd("LspAttach", {
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
		vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)

		-- Diagnostics
		vim.keymap.set("n", "<leader>dn", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "diagnostic" })

		vim.keymap.set("n", "<leader>dp", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "revious" })

		vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "float" })

		vim.keymap.set("n", "<leader>dt", function()
			vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
		end, { desc = "virtual text" })

		vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "qflist" })

		vim.keymap.set("n", "<leader>lH", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle inlay hints" })
	end,
})

-- telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ previewer = false })
end)

vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers({ previewer = false })
end)

vim.keymap.set("n", "<leader>fg", function()
	builtin.git_files({ previewer = false })
end)

vim.keymap.set("n", "<leader>fs", function()
	builtin.live_grep()
end)

vim.keymap.set("n", "<leader>fc", function()
	builtin.git_status({ previewer = false })
end)

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window Left" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Window Previous" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Hunk actions
		map("n", "<leader>hs", gitsigns.stage_hunk)
		map("n", "<leader>hr", gitsigns.reset_hunk)
		map("n", "<leader>hp", gitsigns.preview_hunk)

		-- Buffer actions
		map("n", "<leader>hS", gitsigns.stage_buffer)
		map("n", "<leader>hR", gitsigns.reset_buffer)
	end,
})

-- flash keympaps
vim.keymap.set("n", "<leader>s", function()
	require("flash").jump()
end, { desc = "Flash" })

-- qflist navigation
vim.keymap.set("n", "<C-n>", "<cmd>silent! cnext<CR>", { desc = "Next Quickfix item" })
vim.keymap.set("n", "<C-p>", "<cmd>silent! cprev<CR>", { desc = "Previous Quickfix item" })

-- toggle quickfix list
-- vim.keymap.set("n", "<leader>qq", function()
-- 	local qf_exists = false
-- 	for _, win in pairs(vim.fn.getwininfo()) do
-- 		if win["quickfix"] == 1 then
-- 			qf_exists = true
-- 		end
-- 	end
--
-- 	if qf_exists then
-- 		vim.cmd("cclose")
-- 	else
-- 		vim.cmd("copen")
-- 	end
-- end, { desc = "Toggle Quickfix List" })

-- open grep search
-- vim.keymap.set("n", "<leader>g", function()
-- 	local pattern = vim.trim(vim.fn.input("Grep> "))
--
-- 	if pattern == "" then
-- 		return
-- 	end
--
-- 	vim.cmd("silent grep! " .. vim.fn.shellescape(pattern))
-- 	vim.cmd("copen")
-- end, { desc = "grep" })

-- toggle quickfix list short names
-- vim.keymap.set("n", "<leader>qs", function()
-- 	if vim.o.quickfixtextfunc == "" then
-- 		vim.o.quickfixtextfunc = "v:lua.qf_filename"
-- 		print("Quickfix: Short names enabled")
-- 	else
-- 		vim.o.quickfixtextfunc = ""
-- 		print("Quickfix: Full paths enabled")
-- 	end
-- end, { desc = "Toggle Quickfix Short Paths" })

-- toggle blink completion
vim.keymap.set("n", "<leader>c", function()
	vim.g.blink_enabled = not vim.g.blink_enabled
	local enabled = vim.g.blink_enabled and "Enabled" or "Disabled"
	vim.notify("Blink Status: " .. enabled)
end, { desc = "Toggle Blink CMP" })
