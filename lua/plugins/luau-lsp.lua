return {
	"lopi-py/luau-lsp.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
	},
	ft = "luau",
	config = function()
		local function get_platform_type()
			local is_rojo_project = vim.fs.root(0, function(name)
				return name:match(".+%.project%.json$")
			end)

			return is_rojo_project and "roblox" or "standard"
		end

		local function get_capabilities()
			return require("blink.cmp").get_lsp_capabilities({
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			})
		end

		vim.lsp.config("luau_lsp", {
			capabilities = get_capabilities(),
			settings = {
				["luau-lsp"] = {
					completion = {
						imports = {
							enabled = true,
						},
					},
				},
			},
		})

		require("luau-lsp").setup({
			platform = {
				type = get_platform_type(),
			},
			types = {
				roblox_security_level = "PluginSecurity",
			},
			sourcemap = {
				enabled = true,
				autogenerate = true,
				rojo_project_file = "default.project.json",
				sourcemap_file = "sourcemap.json",
			},
			plugin = {
				enabled = false,
				port = 3667,
			},
			fflags = {
				enable_new_solver = true,
				sync = true,
				override = {},
			},
		})
	end,
}
