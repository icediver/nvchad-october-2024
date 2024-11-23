local M = {}
M.opts = {
  enabled = true,
  -- symbol = "…", -- 󱏿
  symbol = "󱏿", -- 󱏿
  -- highlight = {
  fg = "#38BDF8", -- [[ symbol color ]]
}
M.dependencies = { "nvim-treesitter/nvim-treesitter" }

M.ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" }

return M
