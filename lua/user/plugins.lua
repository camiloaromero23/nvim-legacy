-- My plugins here
local start_plugins = {
  -- Core plugins
  { "wbthomason/packer.nvim" }, -- Have packer manage itself
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

  -- Completion plugins
  { "folke/lua-dev.nvim" }, -- init.lua dev plugin
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" }, -- lsp completions

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "p00f/nvim-ts-rainbow",
  },

  -- Web Dev icons
  {
    "kyazdani42/nvim-web-devicons",
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
  },

  -- Comment
  { "numToStr/Comment.nvim" }, -- Easily comment stuff
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- Git Signs
  { "lewis6991/gitsigns.nvim" },

  -- NvimTree
  { 'kyazdani42/nvim-tree.lua' },

  -- Bufferline
  { "akinsho/bufferline.nvim"},
  { "moll/vim-bbye"},

  -- Personal plugins
  {
    "SmiteshP/nvim-gps",
    config = function()
      require("user.gps").config()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.nvim_colorizer").config()
    end,
  },
  {
    "fatih/vim-go",
    config = function()
      require("user.vim-go").config()
    end,
    ft = { "go" },
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("user.git_blame").config()
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "tpope/vim-surround",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require "user.matchup"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("user.indent-blankline").config()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("user.rust_tools").config()
    end,
    ft = { "rust", "rs" },
  },
  {
    "thosakwe/vim-flutter",
    ft = { "dart" },
  },
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.cmd [[ imap <silent><script><expr> <Right> copilot#Accept("") ]]
      vim.g.copilot_node_command = "/usr/local/n/versions/node/16.14.2/bin/node"
    end,
  },
  {
    "marko-cerovac/material.nvim",
  },
  {
    "metakirby5/codi.vim",
  },
}

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  for _, value in pairs(start_plugins) do
    use(value)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
