return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = "+telescope" },
			{ "<leader>h", group = "+harpoon" },
			{ "<leader>g", group = "+git" },
			{ "<leader>H", group = "+help/debug/conceal" },
			{ "<leader>n", group = "+files" },
			{ "<leader>o", group = "+obsidian" },
			{ "<leader>t", group = "+treesitter" },
			{ "<leader>f", group = "+DAP" },
			{ "<leader>x", group = "+trouble" },
			{ "<leader>r", group = "+refactoring" },
			{ "<leader>s", group = "+split_window" },
			{
				"<leader>b",
				group = "buffers",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
		})
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
