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
		end, { desc = "Next" })

		vim.keymap.set("n", "<leader>dp", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Previous" })

		vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Float" })

		vim.keymap.set("n", "<leader>dt", function()
			vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
		end, { desc = "Virtual text" })

		vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Qflist" })

		vim.keymap.set("n", "<leader>lH", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Inlay hints" })
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

-- gitsigns
local gitsigns = require("gitsigns")

-- Hunk navigation
vim.keymap.set("n", "]h", function()
	gitsigns.nav_hunk("next")
end, { desc = "Next hunk" })

vim.keymap.set("n", "[h", function()
	gitsigns.nav_hunk("prev")
end, { desc = "Previous hunk" })

-- Hunk actions (stage_hunk toggles: staging a staged hunk unstages it)
vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage/unstage hunk" })
vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })

vim.keymap.set("v", "<leader>gs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage selection" })

vim.keymap.set("v", "<leader>gr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selection" })

vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })

-- Buffer actions
vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

-- Blame / diff
vim.keymap.set("n", "<leader>gb", function()
	gitsigns.blame_line({ full = true })
end, { desc = "Blame line" })

vim.keymap.set("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })

-- All hunks -> quickfix
vim.keymap.set("n", "<leader>gq", gitsigns.setqflist, { desc = "Hunks to quickfix" })

-- Hunk text object (e.g. `vih`, `dih`)
vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })

-- flash keympaps
vim.keymap.set("n", "<leader>s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set("n", "<leader>c", function()
	vim.g.blink_enabled = not vim.g.blink_enabled
	local enabled = vim.g.blink_enabled and "Enabled" or "Disabled"
	vim.notify("Blink Status: " .. enabled)
end, { desc = "Toggle Blink CMP" })
