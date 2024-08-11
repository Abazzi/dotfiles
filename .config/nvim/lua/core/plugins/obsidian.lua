return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "brain",
				path = "~/brain",
				overrides = {
					templates = {
						date_format = "%Y-%m-%d-%a",
						time_format = "%H:%M",
						folder = "templates",
					},
				},
			},
			{
				name = "buf-parent",
				path = function()
					return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
				end,
			},
		},

		-- see below for full list of options 👇
	},
	-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
	completion = {
		-- Set to false to disable completion.
		nvim_cmp = true,

		-- Trigger completion at 2 chars.
		min_chars = 2,

		-- Where to put new notes created from completion. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "wiki",

		-- Control how wiki links are completed with these (mutually exclusive) options:
		--
		-- 1. Whether to add the note ID during completion.
		-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
		-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
		prepend_note_id = true,
		-- 2. Whether to add the note path during completion.
		-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
		-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
		prepend_note_path = false,
		-- 3. Whether to only use paths during completion.
		-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
		-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
		use_path_only = false,
	},
	-- Optional, configure additional syntax highlighting / extmarks.
	-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
	ui = {
		enable = true, -- set to false to disable all additional syntax features
		update_debounce = 200, -- update delay after a text change (in milliseconds)
		-- Define how various check-boxes are displayed
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" },
			[">"] = { char = "", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			-- Replace the above with this if you don't have a patched font:
			-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
			-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

			-- You can also add more custom ones...
		},
		-- Use bullet marks for non-checkbox lists.
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		-- Replace the above with this if you don't have a patched font:
		-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},
	mappings = {
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
	templates = {
		subdir = "templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		-- A map for custom variables, the key should be the variable and the value a function
		substitutions = {},
	},

	vim.keymap.set("n", "<leader>oo", "<cmd>:ObsidianOpen<cr>", { desc = "Obsidian: Open File" }),
	vim.keymap.set("n", "<leader>on", "<cmd>:ObsidianNew<cr>", { desc = "Obsidian: New File" }),
	vim.keymap.set("n", "<leader>os", "<cmd>:ObsidianSearch<cr>", { desc = "Obsidian: Search" }),
	vim.keymap.set("n", "<leader>ot", "<cmd>:ObsidianTags<cr>", { desc = "Obsidian: Show Tag Locations" }),
	vim.keymap.set("n", "<leader>or", "<cmd>:ObsidianRename<cr>", { desc = "Obsidian: Rename Current File" }),
	vim.keymap.set(
		"n",
		"<leader>ont",
		"<cmd>:ObsidianNewFromTemplate<cr>",
		{ desc = "Obsidian: Create New File From Template" }
	),
}
