local cmp_local = require "cmp"

dofile(vim.g.base46_cache .. "cmp")
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
  Codeium = "",
}
local cmp_ui = require("nvconfig").ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "menu", "abbr", "kind" },
  atom_colored = { "menu", "abbr", "kind" },
}

local formatting_style = {

  fields = { "kind", "abbr", "menu" }, -- order of columns,
  format = function(entry, item)
    item.menu = item.kind
    item = require("cmp-tailwind-colors").format(entry, item)
    if kind_icons[item.kind] then
      item.kind = kind_icons[item.kind] .. " "
    end
    return item
  end,
}

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local options = {
  completion = {
    completeopt = "menu,menuone",
  },

  window = {
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      winhighlight = "normal:cmppmenu,cursorline:cmpsel,search:none",
      scrollbar = false,
    },
    documentation = {
      border = border "cmpdocborder",
      winhighlight = "normal:cmpdoc",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  mapping = {
    ["<c-p>"] = cmp_local.mapping.select_prev_item(),
    ["<c-n>"] = cmp_local.mapping.select_next_item(),
    ["<c-d>"] = cmp_local.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp_local.mapping.scroll_docs(4),
    ["<c-space>"] = cmp_local.mapping.complete(),
    ["<c-e>"] = cmp_local.mapping.close(),

    ["<CR>"] = cmp_local.mapping.confirm {
      -- behavior = cmp.confirmbehavior.insert,
      select = true,
    },

    ["<tab>"] = cmp_local.mapping(function(fallback)
      if cmp_local.visible() then
        cmp_local.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<s-tab>"] = cmp_local.mapping(function(fallback)
      if cmp_local.visible() then
        cmp_local.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "luasnip", priority = 5000 },
    { name = "emmet_ls" },
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  options.window.completion.border = border "cmpborder"
end

return options
