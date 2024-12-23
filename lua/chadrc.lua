-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = true,
  telescope = {
    style = "bordered",
  }, -- borderless / bordered
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    separator_style = "block", -- block/arrow/default/round
    --separator_style = "arrow",
  },

  hl_override = {
    Comment = { italic = true, bg = "none", fg = "#059669" },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
    Visual = {
      bg = "#737373",
      fg = "none",
    },
    CursorLineNr = {
      bg = "#6d87d6",
    },
    LineNr = {
      fg = "#a0a0a0",
      bg = "none",
    },
    SpellBad = { bg = "none", fg = "NONE", sp = "#FF0000" },
    SpellCap = { bg = "none", fg = "#FF0000" },
    SpellLocal = { bg = "none", fg = "#FF0000" },
    SpellRare = { bg = "none", fg = "#FF0000" },

    FloatBorder = { fg = "#5A0DAC", bg = "NONE" },
    NormalFloat = { fg = "NONE", bg = "NONE" },
    CmpBorder = { link = "FloatBorder" },
    CmpDocBorder = { link = "CmpBorder" },
    CmpDoc = { bg = "NONE", fg = "orange" },
    NvimTreeCursorLine = { link = "CursorLine" },
  }, -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {

  statusline = {
    separator_style = "arrow",
    theme = "default",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
      "position",
    },
    modules = {
      position = " l: %l  c: %c",
    },
  },
  telescope = {
    style = "bordered",
  },
  cmp = {
    icons_left = true,
    format_colors = {
      tailwind = true,
    },
  },
}

return M
