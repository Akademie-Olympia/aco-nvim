-- lualine theme "aco": mode badge in a palette colour (accent for normal mode),
-- the rest quiet on the bar background. Falls back to "auto" without aco-theme.
local c = require("aco.palette").load()
if not c then
  return require("lualine.themes.auto")
end

local function mode(color)
  return {
    a = { fg = c.bg, bg = color, gui = "bold" },
    b = { fg = c.text, bg = c.surface_alt },
    c = { fg = c.subtext, bg = c.bg_alt },
  }
end

return {
  normal = mode(c.accent),
  insert = mode(c.green),
  visual = mode(c.purple),
  replace = mode(c.red),
  command = mode(c.orange),
  terminal = mode(c.cyan),
  inactive = {
    a = { fg = c.muted, bg = c.bg_alt },
    b = { fg = c.muted, bg = c.bg_alt },
    c = { fg = c.muted, bg = c.bg_alt },
  },
}
