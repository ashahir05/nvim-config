local M = {
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "nvim-treesitter/nvim-treesitter" },
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },
  { "akinsho/bufferline.nvim" },
  { "moll/vim-bbye" },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/toggleterm.nvim" },
  { "ahmedkhalf/project.nvim" },
  { "lewis6991/impatient.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "goolord/alpha-nvim" },
  { "folke/which-key.nvim" },

  -- Colorschemes
  { "bluz71/vim-moonfly-colors" },

  -- Cmp
  { "hrsh7th/nvim-cmp" },        -- The completion plugin
  { "hrsh7th/cmp-buffer" },      -- buffer completions
  { "hrsh7th/cmp-path" },        -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },            -- snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig" },          -- enable LSP
  { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
  { "RRethy/vim-illuminate" },

  -- DAP
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  { "max397574/better-escape.nvim" },
  {
    "phaazon/hop.nvim",
    branch = "v2",
  },
  { "arkav/lualine-lsp-progress" },
}

return M;
