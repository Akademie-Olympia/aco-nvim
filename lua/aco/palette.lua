-- Loads the ACO palette rendered by aco-theme (~/.config/aco/theme/nvim/palette.lua).
-- Returns nil when aco-theme is not installed (for example on a server), so
-- callers can fall back to Neovim's built-in colour scheme.
local M = {}

M.file = (vim.env.XDG_CONFIG_HOME or (vim.env.HOME .. "/.config")) .. "/aco/theme/nvim/palette.lua"

function M.load()
  local ok, palette = pcall(dofile, M.file)
  if ok and type(palette) == "table" and palette.bg then
    return palette
  end
  return nil
end

-- Mix two "#rrggbb" colours; amount 0 gives `a`, 1 gives `b`.
function M.blend(a, b, amount)
  local function channel(hex, i)
    return tonumber(hex:sub(i, i + 1), 16)
  end
  local out = "#"
  for i = 2, 6, 2 do
    out = out .. string.format("%02x", math.floor(channel(a, i) * (1 - amount) + channel(b, i) * amount + 0.5))
  end
  return out
end

return M
