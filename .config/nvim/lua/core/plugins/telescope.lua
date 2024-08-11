return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		opts = {
			file_ignore_patterns = { "node_modules", "^./%.git/" },
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	-- Telescope  vim.keymap.sets
	vim.keymap.set("n", "<C-f>", function()
		require("telescope.builtin").find_files({ hidden = true })
	end, { desc = "Find Files" }),
	vim.keymap.set("n", "<leader>gf", function()
		require("telescope.builtin").git_files({ hidden = true })
	end, { desc = "Find Git Tracked Files" }),
	vim.keymap.set("n", "<C-s>", function()
		require("telescope.builtin").grep_string()
	end, { desc = "Grep String" }),
	vim.keymap.set("n", "<leader>fg", function()
		require("telescope.builtin").git_files()
	end, { desc = "Find Git File" }),
	vim.keymap.set("n", "<C-g>", function()
		require("telescope.builtin").live_grep()
	end, { desc = "Live Grep" }),
	vim.keymap.set("n", "<leader>fr", function()
		require("telescope.builtin").oldfiles()
	end, { desc = "Open Recent File" }),
	vim.keymap.set("n", "<leader>fm", function()
		require("telescope.builtin").marks()
	end, { desc = "Show Marks" }),
	vim.keymap.set("n", "<leader>fb", function()
		require("telescope.builtin").buffers()
	end, { desc = "Find Buffer" }),
}
