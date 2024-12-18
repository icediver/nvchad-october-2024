require "nvchad.mappings"

-- add yours here

local ls = require "luasnip"
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Basic
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })

-- Codeium
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

map("i", "<C-l>", function()
  return vim.fn["codeium#AcceptNextWord"]()
end, { expr = true })

map("i", "<C-j>", function()
  return vim.fn["codeium#AcceptNextLine"]()
end, { expr = true })

-- Tailwind-Fold
map("n", "<Leader>tf", "<cmd>:TailwindFoldToggle<CR>", { desc = "Toggle tailwind fold" })

-- Terminal
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })

-- LSP Saga
-- vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "<Leader>jj", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
map("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
-- map("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
map("n", "<Leader>gr", "<Cmd>Lspsaga rename<CR>", opts)
-- code action
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Snippets LuaSnip

map({ "i", "s" }, "<A-n>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

map({ "i", "s" }, "<A-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map({ "i", "s" }, "<A-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>");

-- menu

-- Keyboard users
map("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
