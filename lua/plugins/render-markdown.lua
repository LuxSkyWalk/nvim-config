return {
	"Meandering/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	opts = {
		completions = {
			lsp = {
				enabled = true,
			},
			blink = {
				enabled = true,
			},
		},
	},
}
