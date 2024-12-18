return {
  "laytan/tailwind-sorter.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  build = "cd formatter && npm ci && npm run build",
  config = true,
  -- config = function()
  --   return {
  --     on_save_enabled = true, -- If `true`, automatically enables on save sorting.
  --     on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" }, -- The file patterns to watch and sort.
  --     node_path = "node",
  --     trim_spaces = false, -- If `true`, trim any extra spaces after sorting.
  --   }
  -- end,
}
