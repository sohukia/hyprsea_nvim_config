---------------------------------------------------------------
-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ███████╗███████╗ █████╗  --
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗ --
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝███████╗█████╗  ███████║ --
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════██║██╔══╝  ██╔══██║ --
-- ██║  ██║   ██║   ██║     ██║  ██║███████║███████╗██║  ██║ --
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ --
---------------------------------------------------------------

-- Session keeper configuration
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,localoptions"

-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
require("lazy").setup({
  -- LSP and autocomplete
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },
  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  -- Git integration
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- Add indentation guides
  'lukas-reineke/indent-blankline.nvim',
  -- Commenting utility
  'numToStr/Comment.nvim',
  -- Fancier UI for inputs
  'stevearc/dressing.nvim',
  -- File explorer
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  -- Catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },
  -- Other useful plugins
  'lewis6991/gitsigns.nvim', -- Git gutter
  'windwp/nvim-autopairs', -- Auto-closing brackets and quotes
  'kyazdani42/nvim-web-devicons', -- Icons for various file types
  'akinsho/toggleterm.nvim', -- Terminal integration
  'folke/which-key.nvim', -- Show keybindings
  'glepnir/dashboard-nvim', -- Startup dashboard

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
        require("telescope").setup {
            defaults = {
                prompt_prefix = "> ",
                mappings = {
                    i = {
                        ["<C-n>"] = require("telescope.actions").move_selection_next,
                        ["<C-p>"] = require("telescope.actions").move_selection_previous,
                    },
                },
            },
        }
    end
  },

  -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    event = "BufReadPost",
  },
  
  -- Session loader
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_enable_last_session = true,
        auto_session_create_enabled = false,
        auto_save_enabled = true,
        auto_restore_enabled = true,
    }
    end
  }

})

-- Custom configurations
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Enable folding based on Treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Always start unfolded
vim.o.foldlevelstart = 99

-- Lualine configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin', -- Setting catppuccin theme for lualine
    component_separators = '|',
    section_separators = '',
  },
}


-- Indent blankline config
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }

-- Gitsigns configuration
require('gitsigns').setup()

-- Autopairs configuration
require('nvim-autopairs').setup()

-- Toggleterm configuration
require('toggleterm').setup()

-- Which-key configuration
require('which-key').setup()

-- Dashboard configuration
require('dashboard').setup {
  theme = 'doom',
  config = {
    header = { -- ASCII art for the dashboard
        '██╗  ██╗██╗   ██╗██████╗ ██████╗ ███████╗███████╗ █████╗',
        ' ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗',
        ' ███████║ ╚████╔╝ ██████╔╝██████╔╝███████╗█████╗  ███████║',
        ' ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════██║██╔══╝  ██╔══██║',
        ' ██║  ██║   ██║   ██║     ██║  ██║███████║███████╗██║  ██║',
        ' ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝',
    },
    center = {
      { icon = ' ', desc = 'Find File       ', action = 'Telescope find_files' },
      { icon = ' ', desc = 'Recents         ', action = 'Telescope oldfiles' },
      { icon = ' ', desc = 'Find Word       ', action = 'Telescope live_grep' },
      { icon = ' ', desc = 'New File        ', action = 'enew' },
      { icon = ' ', desc = 'Last Session    ', action = 'SessionRestore' },
    },
  },
}



