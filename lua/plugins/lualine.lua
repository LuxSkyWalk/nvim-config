return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "catppuccin",
			component_separators = {
				left = "|",
				right = "|",
			},
			section_separators = {
				left = "",
				right = "",
			},
		},
		sections = {
			lualine_b = { "lsp_status", "branch", "diff" },
			lualine_c = { "diagnostics", "filename" },
		},
	},
}
