return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'catppuccin/nvim'

	-- plenary 
	use 'nvim-lua/plenary.nvim'

	-- for telescope
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- autopairs
	use {
	"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}

	use {
        'nvim-treesitter/nvim-treesitter'
    	}

	
	-- lspconfig
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use { "williamboman/mason.nvim" }

end)

