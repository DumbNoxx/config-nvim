return {
	"mason-org/mason.nvim",
	opts = {
		automatic_enable = {
			"lua_ls",
			"gopls",
			"dartls",
			"vue_ls",
			"vtsls",
			"angularls",
            "zls"
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local vue_language_server_path =
			"/home/nxus/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"
		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}
		vim.lsp.config("vtsls", {
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							vue_plugin,
						},
					},
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		})

        local mason_packages = "/home/nxus/.local/share/nvim/mason/packages"
        local ts_lib = mason_packages .. "/angular-language-server/node_modules"
		local cmd = {
			"/home/nxus/.local/share/nvim/mason/bin/ngserver",
			"--stdio",
			"--tsProbeLocations",
			ts_lib,
			"--ngProbeLocations",
			ts_lib,
		}

		vim.lsp.config("angularls", {
			cmd = cmd,
			root_markers = { "angular.json", "project.json", "nx.json" },
		})

		vim.lsp.enable("vue_ls")
		vim.lsp.enable("vtsls")
		vim.lsp.enable("angularls")
        vim.lsp.enable('zls')
        vim.lsp.enable('clangd')
        vim.lsp.enable('somesass_ls')
	end,
}
