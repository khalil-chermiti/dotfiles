require("toggleterm").setup({
	size = 20,
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell,
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "single",
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-t><C-n>]], opts)
	vim.keymap.set("t", "jj", [[<C-t><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-t><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
