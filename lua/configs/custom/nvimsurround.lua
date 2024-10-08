require("nvim-surround").setup {
  -- Configuration here, or leave empty to use defaults
  surrounds = {
    ["/"] = {
      add = { "{/*", "*/}" },
    },
  },
}

-- local M = {}
--
-- M.surrounds = {
--   ["/"] = {
--     add = { "{/*", "*/}" },
--   },
-- }
--
-- return M
