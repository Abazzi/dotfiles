return {
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.basics",
		version = "*",
		config = function()
			require("mini.basics").setup({
				mappings = {
					basic = true,
					option_toggle_prefix = [[\]],
					windows = true,
					move_with_alt = true,
				},
			})
		end,
	},
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
		specs = { { "nvim-tree/nvim-web-devicons", enabled = false, optional = true } },
		init = function()
			package.preload["nvim-web-devicons"] = function()
				package.loaded["nvim-web-devicons"] = {}
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"echasnovski/mini.comment",
		version = "*",
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
}
