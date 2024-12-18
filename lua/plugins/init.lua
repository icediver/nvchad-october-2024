local overrides = require "configs.overrides"
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      "nvimdev/lspsaga.nvim",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "configs.custom.lspsaga"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require "configs.custom.nvimsurround"
    end,
  },
  require "plugins.options.cmp",
  {
    "Exafunction/codeium.vim",
    lazy = false,
    config = function()
      require "plugins.options.codeium"
    end,
  },
  require "plugins.options.tw-sorter",

  {
    "js-everts/cmp-tailwind-colors",
    opts = require "plugins.options.tw-colors",
  },
  {
    "razak17/tailwind-fold.nvim",
    opts = {
      symbol = "󱏿", -- 󱏿
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LspAttach",
    config = function()
      require "configs.custom.rainbow-delimiters"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    -- opts = {
    --   -- other config
    --   linters = {
    --     eslint_d = {
    --       args = {
    --         "--no-warn-ignored", -- <-- this is the key argument
    --         "--format",
    --         "json",
    --         "--stdin",
    --         "--stdin-filename",
    --         function()
    --           return vim.api.nvim_buf_get_name(0)
    --         end,
    --       },
    --     },
    --   },
    -- },
    config = function()
      require "configs.custom.lint"
    end,
  },
  { "nvchad/volt", lazy = true },
  { "nvchad/menu", lazy = true },
  require "plugins.options.minty",
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  require "configs.custom.todo",
}
