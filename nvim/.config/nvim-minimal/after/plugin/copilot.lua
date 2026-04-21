require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		hide_during_completion = true,
		debounce = 15,
		trigger_on_accept = true,

		keymap = {
			accept = "<Tab>",
			accept_word = false,
			accept_line = false,
			next = false,
			prev = false,
			dismiss = false,
			toggle_auto_trigger = false,
		},
	},
})
