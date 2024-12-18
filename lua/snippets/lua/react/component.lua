local ls = require "luasnip"
local c = ls.choice_node
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep
-- local l = require("luasnip.extras").lambda
-- local treesitter_postfix = require("luasnip.extras.treesitter_postfix").treesitter_postfix
-- local postfix = require("luasnip.extras.postfix").postfix
-- local su = require "snippets.lua.common.snip_utils"
-- local nl = su.new_line
-- local te = su.trig_engine
-- local jt = su.join_text

-- local function page_name(_, parent)
--   return sn(nil, i(1, su.dir_name(parent)))
-- end
--
-- local function file_name(_, parent)
--   return sn(nil, i(1, su.file_name(parent)))
-- end

return {
  s(
    {
      trig = "ns",
      name = "Simple Nextjs component",
      dscr = "Next.js simple component",
      priority = 5000,
    },
    fmt(
      [[export default function {} ()  {{
        return <div>{}</div>
  }}
  ]],
      {
        d(1, "file_name"),
        rep(1),
      }
    )
  ),
  s({ trig = "usm", descr = '(useM) "useMemo(fn, inputs)"', priority = 0 }, {
    t "const ",
    i(1, "memorized", { key = "i1" }),
    t " = useMemo(() => ",
    c(2, { key = "i2" }),
    t ", [",
    i(3, "", { key = "i4" }),
    t "])",
  }),
}
