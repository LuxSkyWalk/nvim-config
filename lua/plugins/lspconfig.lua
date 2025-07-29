return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
		"folke/neoconf.nvim",
		"folke/lazydev.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		require("neoconf").setup({
			local_settings = ".neoconf.jsonc",
			global_settings = "neoconf.jsonc",

			import = {
				vscode = true,
			},
			live_reload = true,
			filetype_jsonc = true,
			plugins = {
				lspconfig = {
					enabled = true,
				},

				jsonls = {
					enabled = true,
					configured_servers_only = false,
				},

				lua_ls = {
					enabled_for_neovim_config = true,
					enabled = false,
				},
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspAutoCmds", {}),
			callback = function(args)
				local function opts(desc)
					return {
						silent = true,
						buffer = args.buf,
						desc = desc,
					}
				end

				local map = vim.keymap.set
				map("n", "K", vim.lsp.buf.hover, opts("Hover"))
				map(
					"n",
					"<C-k>",
					vim.lsp.buf.signature_help,
					opts("Signature help")
				)
				map("n", "<leader>rn", function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end, { expr = true })
				map(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					opts("Code action")
				)
			end,
		})

		local function get_capabilities()
			return require("blink.cmp").get_lsp_capabilities({
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			})
		end

		local function setup_handlers(handlers)
			local default_handler = handlers[1]

			for _, server_name in pairs(mason_lspconfig.get_installed_servers()) do
				if handlers[server_name] then
					handlers[server_name]()
				else
					default_handler(server_name)
				end
			end
		end

		setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = get_capabilities(),
				})
			end,

			lua_ls = function()
				lspconfig.lua_ls.setup({
					capabilities = get_capabilities(),
					settings = {
						Lua = {
							diagnostics = {
								enabled = true,
								globals = { "vim" },
							},
						},
					},
				})
			end,

			-- luau-lsp is configured via lopi-py/luau-lsp.nvim plugin
			luau_lsp = function() end,

			jsonls = function()
				local function get_json_schemas()
					local schemas = require("schemastore").json.schemas()

					table.insert(schemas, {
						fileMatch = { "*.project.json" },
						url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
					})

					return schemas
				end

				lspconfig.jsonls.setup({
					capabilities = get_capabilities(),
					settings = {
						json = {
							schemas = get_json_schemas(),
							validate = { enable = true },
						},
					},
				})
			end,
		})
	end,
}
