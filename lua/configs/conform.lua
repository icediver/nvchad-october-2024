local M = {}

M.formatters_by_ft = {
  lua = { "stylua" },
  css = { "prettier" },
  html = { "prettier" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  javascriptreact = { "prettier" },
  json = { "prettier" },
  yaml = { "prettier" },
  markdown = { "prettier" },
  svg = { "prettier" },
}

M.formatters = {
  prettier = {
    prepend_args = {
      "--single-attribute-per-line",
      -- "--no-bracket-same-line",
    },
  },
}

M.format_on_save = {
  -- These options will be passed to conform.format()
  timeout_ms = 1000,
  lsp_fallback = true,
}

return M
