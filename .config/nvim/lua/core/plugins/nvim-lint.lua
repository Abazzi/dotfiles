return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
		}

		local lint = require("lint")
		local eslint = lint.linters.eslint_d

		eslint.args = {
			"--no-warn-ignored", -- <-- this is the key argument
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
