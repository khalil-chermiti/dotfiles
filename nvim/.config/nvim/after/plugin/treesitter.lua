require("nvim-treesitter").setup({})

require("nvim-treesitter").install({
	"bash",
	"blade",
	"c",
	"comment",
	"css",
	"diff",
	"dockerfile",
	"fish",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"html",
	"ini",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"luadoc",
	"luap",
	"make",
	"markdown",
	"markdown_inline",
	"nginx",
	"nix",
	"proto",
	"python",
	"query",
	"regex",
	"rust",
	"scss",
	"sql",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
})

require("nvim-treesitter-textobjects").setup({
	select = {
		enable = true,
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		},
		include_surrounding_whitespace = false,
	},
	move = {
		enable = true,
		set_jumps = true,
	},
})


-- =============================================================================
-- TEXT OBJECT SELECTIONS
-- =============================================================================
local ts_select = require("nvim-treesitter-textobjects.select")

-- Functions
vim.keymap.set({ "x", "o" }, "af", function()
	ts_select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select around function" })

vim.keymap.set({ "x", "o" }, "if", function()
	ts_select.select_textobject("@function.inner", "textobjects")
end, { desc = "Select inside function" })

-- Classes
vim.keymap.set({ "x", "o" }, "ac", function()
	ts_select.select_textobject("@class.outer", "textobjects")
end, { desc = "Select around class" })

vim.keymap.set({ "x", "o" }, "ic", function()
	ts_select.select_textobject("@class.inner", "textobjects")
end, { desc = "Select inside class" })

-- Conditionals
vim.keymap.set({ "x", "o" }, "ai", function()
	ts_select.select_textobject("@conditional.outer", "textobjects")
end, { desc = "Select around conditional" })

vim.keymap.set({ "x", "o" }, "ii", function()
	ts_select.select_textobject("@conditional.inner", "textobjects")
end, { desc = "Select inside conditional" })

-- Loops
vim.keymap.set({ "x", "o" }, "al", function()
	ts_select.select_textobject("@loop.outer", "textobjects")
end, { desc = "Select around loop" })

vim.keymap.set({ "x", "o" }, "il", function()
	ts_select.select_textobject("@loop.inner", "textobjects")
end, { desc = "Select inside loop" })

-- Parameters / Arguments
vim.keymap.set({ "x", "o" }, "aa", function()
	ts_select.select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select around parameter/argument" })

vim.keymap.set({ "x", "o" }, "ia", function()
	ts_select.select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inside parameter/argument" })

-- Comments
vim.keymap.set({ "x", "o" }, "aC", function()
	ts_select.select_textobject("@comment.outer", "textobjects")
end, { desc = "Select around comment" })

-- Blocks
vim.keymap.set({ "x", "o" }, "ab", function()
	ts_select.select_textobject("@block.outer", "textobjects")
end, { desc = "Select around block" })

vim.keymap.set({ "x", "o" }, "ib", function()
	ts_select.select_textobject("@block.inner", "textobjects")
end, { desc = "Select inside block" })

-- Language Scopes
vim.keymap.set({ "x", "o" }, "as", function()
	ts_select.select_textobject("@block.outer", "locals")
end, { desc = "Select language scope" })

-- Variable Declarations / Assignments
vim.keymap.set({ "x", "o" }, "av", function()
	ts_select.select_textobject("@assignment.outer", "textobjects")
end, { desc = "Select around variable assignment" })

vim.keymap.set({ "x", "o" }, "iv", function()
	ts_select.select_textobject("@assignment.inner", "textobjects")
end, { desc = "Select inside variable assignment" })

vim.keymap.set({ "x", "o" }, "lv", function()
	ts_select.select_textobject("@assignment.lhs", "textobjects")
end, { desc = "Select left hand side of assignment" })

vim.keymap.set({ "x", "o" }, "rv", function()
	ts_select.select_textobject("@assignment.rhs", "textobjects")
end, { desc = "Select right hand side of assignment" })

-- =============================================================================
-- MOVEMENTS
-- =============================================================================

local ts_move = require("nvim-treesitter-textobjects.move")

-- Next Start
vim.keymap.set({ "n", "x", "o" }, "]f", function()
	ts_move.goto_next_start("@function.outer")
end, { desc = "Next function start" })

vim.keymap.set({ "n", "x", "o" }, "]c", function()
	ts_move.goto_next_start("@class.outer")
end, { desc = "Next class start" })

vim.keymap.set({ "n", "x", "o" }, "]a", function()
	ts_move.goto_next_start("@parameter.inner")
end, { desc = "Next parameter start" })

vim.keymap.set({ "n", "x", "o" }, "]b", function()
	ts_move.goto_next_start("@block.outer")
end, { desc = "Next block start" })

-- Next End
vim.keymap.set({ "n", "x", "o" }, "]F", function()
	ts_move.goto_next_end("@function.outer")
end, { desc = "Next function end" })

vim.keymap.set({ "n", "x", "o" }, "]C", function()
	ts_move.goto_next_end("@class.outer")
end, { desc = "Next class end" })

-- Previous Start
vim.keymap.set({ "n", "x", "o" }, "[f", function()
	ts_move.goto_previous_start("@function.outer")
end, { desc = "Previous function start" })

vim.keymap.set({ "n", "x", "o" }, "[c", function()
	ts_move.goto_previous_start("@class.outer")
end, { desc = "Previous class start" })

vim.keymap.set({ "n", "x", "o" }, "[a", function()
	ts_move.goto_previous_start("@parameter.inner")
end, { desc = "Previous parameter start" })

vim.keymap.set({ "n", "x", "o" }, "[b", function()
	ts_move.goto_previous_start("@block.outer")
end, { desc = "Previous block start" })

-- Previous End
vim.keymap.set({ "n", "x", "o" }, "[F", function()
	ts_move.goto_previous_end("@function.outer")
end, { desc = "Previous function end" })

vim.keymap.set({ "n", "x", "o" }, "[C", function()
	ts_move.goto_previous_end("@class.outer")
end, { desc = "Previous class end" })

-- Folding & Indentation
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
