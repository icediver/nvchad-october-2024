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
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "configs.custom.cmp"
    end,
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
    "laytan/tailwind-sorter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    build = "cd formatter && npm ci && npm run build",
    -- config = true,
    config = function()
      require("tailwind-sorter").setup {
        on_save_enabled = true, -- If `true`, automatically enables on save sorting.
        on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" }, -- The file patterns to watch and sort.
        node_path = "node",
        trim_spaces = false, -- If `true`, trim any extra spaces after sorting.
      }
    end,
  },
  {
    "js-everts/cmp-tailwind-colors",
    config = {
      enable_alpha = true, -- requires pumblend > 0.

      format = function(itemColor)
        return {
          fg = itemColor,
          bg = nil, -- or nil if you dont want a background color
          text = "󰏘", -- or use an icon
        }
      end,
    },
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
    config = function()
      require "configs.custom.lint"
    end,
  },
  { "nvchad/volt", lazy = true },
  { "nvchad/menu", lazy = true },
  {
    "nvchad/minty",
    lazy = true,
    dependencies = { "nvchad/volt" },
    keys = {
      {
        "<leader>oc",
        function()
          require("minty.huefy").open { border = true }
        end,
        desc = "Open color picker",
      },
      {
        "<leader>os",
        function()
          require("minty.shades").open()
        end,
        desc = "Open color shades",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = require "configs.custom.todo",
  }, -- To make a plugin not be loaded
}
