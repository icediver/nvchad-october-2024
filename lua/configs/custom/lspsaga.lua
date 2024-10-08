local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

saga.setup {
  ui = {
    winblend = 10,
    border = "rounded",
    colors = {
      normal_bg = "#002b36",
    },
  },
  breadcrumb = {
    enable = true,
  },
  symbol_in_winbar = {
    enable = true,
  },
}

local diagnostic = require "lspsaga.diagnostic"
