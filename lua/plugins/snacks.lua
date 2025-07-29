return {
	"folke/snacks.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	lazy = false,
	opts = {
		picker = {
			enable = true,
			layout = {
				preset = "vertical",
			},
			win = {
				list = {
					wo = {
						number = true,
						relativenumber = true,
					},
				},
			},
		},
		explorer = {
			enable = true,
			replace_netrw = true,
		},
		indent = { enable = true },
		input = { enable = true },
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help",
		},
		{
			"<leader>hl",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},

		{
			"<leader>ft",
			function()
				Snacks.explorer()
			end,
			desc = "File tree",
		},

		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Go to definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Go to declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Go to implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Go to type definition",
		},
	},
}
