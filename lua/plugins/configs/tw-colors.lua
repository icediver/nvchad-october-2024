local M = {}
M.enable_alpha = true -- requires pumblend > 0.

M.format = function(itemColor)
  return {
    fg = itemColor,
    bg = nil, -- or nil if you dont want a background color
    text = "󰏘", -- or use an icon
  }
end

return M
