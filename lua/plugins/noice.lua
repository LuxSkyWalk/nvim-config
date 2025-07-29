return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		messages = { enabled = false },
		popupmenu = { enabled = false },
		notify = { enabled = false },
		lsp = {
			progress = { enabled = false },
			message = { enabled = false },

			hover = { enabled = true },
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					throttle = 250,
				},
			},
		},

		cmdline = {
			enabled = true,
			view = "cmdline",
		},
	},
}
