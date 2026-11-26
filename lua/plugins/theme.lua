-- Colours follow the shared ACO theme: colors/aco.lua reads the palette that
-- aco-theme renders and falls back to Neovim's built-in scheme without it.
-- aco-theme/reload.sh calls apply() in every running Neovim after a change.
local M = {}

function M.apply()
  vim.cmd.colorscheme("aco")
  -- lualine caches its theme at setup; rebuild it from the current palette.
  if package.loaded.lualine then
    package.loaded["lualine.themes.aco"] = nil
    local lualine = require("lualine")
    lualine.setup(lualine.get_config())
  end
end

M.apply()

return M
