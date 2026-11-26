-- Colours follow the shared ACO theme (aco-theme) when it is installed: its
-- palette is mapped onto catppuccin, which keeps every plugin integration.
-- Without it (for example on a server) plain catppuccin mocha is used.
local M = {}

local palette_file = (vim.env.XDG_CONFIG_HOME or (vim.env.HOME .. "/.config")) .. "/aco/theme/nvim/palette.lua"

function M.apply()
  local ok, aco = pcall(dofile, palette_file)
  local flavour = (ok and aco.mode == "light") and "latte" or "mocha"
  require("catppuccin").setup({
    flavour = flavour,
    color_overrides = ok and { [flavour] = aco.colors } or {},
    integrations = {
      cmp = true,
      gitsigns = true,
      telescope = true,
      treesitter = true,
      which_key = true,
      mason = true,
      dap = true,
      dap_ui = true,
      native_lsp = { enabled = true },
    },
  })
  vim.o.background = flavour == "latte" and "light" or "dark"
  vim.cmd.colorscheme("catppuccin")
  -- lualine caches its theme at setup; rebuild it from the current config.
  if package.loaded.lualine then
    local lualine = require("lualine")
    lualine.setup(lualine.get_config())
  end
end

M.apply()

return M
