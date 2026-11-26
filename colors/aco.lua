-- ============================================================================
-- aco: the Neovim colour scheme of the ACO desktop.
--
-- Colours come from the palette aco-theme renders (lua/aco/palette.lua), so
-- light/dark and the accent follow `aco-theme` live. Without aco-theme the
-- built-in "default" scheme is used instead.
--
-- Roles: keywords purple, functions blue, types cyan, strings green, numbers
-- and constants orange, the accent marks the cursor line number, search and
-- selection. Plugin groups cover the plugins this config ships.
-- ============================================================================
local palette = require("aco.palette")
local c = palette.load()

if not c then
  vim.cmd.colorscheme("default")
  return
end

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "aco"
vim.o.background = c.mode == "light" and "light" or "dark"

local blend = palette.blend
-- Soft tints of a colour on the background, for selections and diff lines.
local function tint(color, amount)
  return blend(c.bg, color, amount or 0.18)
end

local groups = {
  -- Editor --------------------------------------------------------------------
  Normal = { fg = c.text, bg = c.bg },
  NormalNC = { link = "Normal" },
  NormalFloat = { fg = c.text, bg = c.surface },
  FloatBorder = { fg = c.border, bg = c.surface },
  FloatTitle = { fg = c.text, bg = c.surface, bold = true },
  Cursor = { fg = c.bg, bg = c.accent },
  CursorLine = { bg = c.bg_alt },
  CursorColumn = { link = "CursorLine" },
  ColorColumn = { bg = c.bg_alt },
  LineNr = { fg = c.border },
  CursorLineNr = { fg = c.accent, bold = true },
  SignColumn = { fg = c.muted },
  FoldColumn = { fg = c.border },
  Folded = { fg = c.subtext, bg = c.bg_alt },
  VertSplit = { fg = c.border },
  WinSeparator = { fg = c.border },
  EndOfBuffer = { fg = c.bg },
  NonText = { fg = c.border },
  Whitespace = { fg = c.border },
  SpecialKey = { fg = c.border },
  Visual = { bg = tint(c.accent, 0.25) },
  VisualNOS = { link = "Visual" },
  Search = { fg = c.text, bg = tint(c.yellow, 0.35) },
  IncSearch = { fg = c.on_accent, bg = c.accent },
  CurSearch = { link = "IncSearch" },
  Substitute = { fg = c.on_accent, bg = c.red },
  MatchParen = { fg = c.accent, bold = true, underline = true },
  Pmenu = { fg = c.text, bg = c.surface },
  PmenuSel = { fg = c.on_accent, bg = c.accent },
  PmenuSbar = { bg = c.surface_alt },
  PmenuThumb = { bg = c.muted },
  PmenuKind = { fg = c.cyan, bg = c.surface },
  PmenuExtra = { fg = c.muted, bg = c.surface },
  StatusLine = { fg = c.subtext, bg = c.bg_alt },
  StatusLineNC = { fg = c.muted, bg = c.bg_alt },
  TabLine = { fg = c.muted, bg = c.bg_alt },
  TabLineSel = { fg = c.text, bg = c.bg, bold = true },
  TabLineFill = { bg = c.bg_alt },
  WinBar = { fg = c.subtext },
  WinBarNC = { fg = c.muted },
  Title = { fg = c.accent, bold = true },
  Directory = { fg = c.blue },
  ModeMsg = { fg = c.subtext, bold = true },
  MoreMsg = { fg = c.green },
  Question = { fg = c.blue },
  WarningMsg = { fg = c.yellow },
  ErrorMsg = { fg = c.red, bold = true },
  QuickFixLine = { bg = tint(c.accent, 0.15) },
  WildMenu = { link = "PmenuSel" },
  SpellBad = { sp = c.red, undercurl = true },
  SpellCap = { sp = c.yellow, undercurl = true },
  SpellLocal = { sp = c.cyan, undercurl = true },
  SpellRare = { sp = c.purple, undercurl = true },

  -- Syntax --------------------------------------------------------------------
  Comment = { fg = c.muted, italic = true },
  Constant = { fg = c.orange },
  String = { fg = c.green },
  Character = { fg = c.green },
  Number = { fg = c.orange },
  Boolean = { fg = c.orange },
  Float = { fg = c.orange },
  Identifier = { fg = c.text },
  Function = { fg = c.blue },
  Statement = { fg = c.purple },
  Conditional = { fg = c.purple },
  Repeat = { fg = c.purple },
  Label = { fg = c.purple },
  Operator = { fg = c.subtext },
  Keyword = { fg = c.purple },
  Exception = { fg = c.purple },
  PreProc = { fg = c.pink },
  Include = { fg = c.purple },
  Define = { fg = c.pink },
  Macro = { fg = c.pink },
  Type = { fg = c.cyan },
  StorageClass = { fg = c.purple },
  Structure = { fg = c.cyan },
  Typedef = { fg = c.cyan },
  Special = { fg = c.pink },
  SpecialChar = { fg = c.pink },
  Tag = { fg = c.blue },
  Delimiter = { fg = c.subtext },
  Debug = { fg = c.red },
  Underlined = { underline = true },
  Error = { fg = c.red },
  Todo = { fg = c.on_accent, bg = c.accent, bold = true },
  Added = { fg = c.green },
  Changed = { fg = c.yellow },
  Removed = { fg = c.red },

  -- Tree-sitter -----------------------------------------------------------------
  ["@variable"] = { fg = c.text },
  ["@variable.builtin"] = { fg = c.red },
  ["@variable.parameter"] = { fg = c.text, italic = true },
  ["@variable.member"] = { fg = c.text },
  ["@property"] = { fg = c.text },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = c.orange },
  ["@module"] = { fg = c.cyan },
  ["@label"] = { link = "Label" },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = c.pink },
  ["@string.regexp"] = { fg = c.pink },
  ["@string.special.url"] = { fg = c.blue, underline = true },
  ["@character"] = { link = "Character" },
  ["@number"] = { link = "Number" },
  ["@boolean"] = { link = "Boolean" },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.cyan, italic = true },
  ["@attribute"] = { fg = c.yellow },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { fg = c.blue },
  ["@function.macro"] = { link = "Macro" },
  ["@constructor"] = { fg = c.cyan },
  ["@operator"] = { link = "Operator" },
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.return"] = { fg = c.purple, bold = true },
  ["@punctuation"] = { fg = c.subtext },
  ["@punctuation.special"] = { fg = c.pink },
  ["@comment"] = { link = "Comment" },
  ["@comment.todo"] = { link = "Todo" },
  ["@comment.error"] = { fg = c.on_accent, bg = c.red },
  ["@comment.warning"] = { fg = c.bg, bg = c.yellow },
  ["@comment.note"] = { fg = c.on_accent, bg = c.accent },
  ["@tag"] = { fg = c.blue },
  ["@tag.attribute"] = { fg = c.yellow },
  ["@tag.delimiter"] = { fg = c.subtext },
  ["@markup.heading"] = { fg = c.accent, bold = true },
  ["@markup.strong"] = { bold = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.link"] = { fg = c.blue },
  ["@markup.link.url"] = { fg = c.blue, underline = true },
  ["@markup.raw"] = { fg = c.green },
  ["@markup.list"] = { fg = c.accent },
  ["@markup.quote"] = { fg = c.subtext, italic = true },
  ["@diff.plus"] = { link = "Added" },
  ["@diff.minus"] = { link = "Removed" },
  ["@diff.delta"] = { link = "Changed" },
  ["@lsp.type.namespace"] = { link = "@module" },
  ["@lsp.type.parameter"] = { link = "@variable.parameter" },
  ["@lsp.type.property"] = { link = "@property" },
  ["@lsp.type.enumMember"] = { link = "@constant" },
  ["@lsp.mod.deprecated"] = { strikethrough = true },

  -- Diagnostics and LSP ---------------------------------------------------------
  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = c.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },
  DiagnosticVirtualTextError = { fg = c.red, bg = tint(c.red, 0.1) },
  DiagnosticVirtualTextWarn = { fg = c.yellow, bg = tint(c.yellow, 0.1) },
  DiagnosticVirtualTextInfo = { fg = c.blue, bg = tint(c.blue, 0.1) },
  DiagnosticVirtualTextHint = { fg = c.cyan, bg = tint(c.cyan, 0.1) },
  DiagnosticUnderlineError = { sp = c.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
  DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
  DiagnosticUnderlineHint = { sp = c.cyan, undercurl = true },
  DiagnosticUnnecessary = { fg = c.muted },
  LspReferenceText = { bg = c.surface_alt },
  LspReferenceRead = { link = "LspReferenceText" },
  LspReferenceWrite = { link = "LspReferenceText" },
  LspInlayHint = { fg = c.muted, bg = c.bg_alt },
  LspSignatureActiveParameter = { fg = c.accent, bold = true },

  -- Diff and git ------------------------------------------------------------------
  DiffAdd = { bg = tint(c.green, 0.15) },
  DiffChange = { bg = tint(c.blue, 0.12) },
  DiffDelete = { fg = c.red, bg = tint(c.red, 0.15) },
  DiffText = { bg = tint(c.blue, 0.3) },
  GitSignsAdd = { fg = c.green },
  GitSignsChange = { fg = c.yellow },
  GitSignsDelete = { fg = c.red },

  -- Completion (nvim-cmp) -------------------------------------------------------
  CmpItemAbbr = { fg = c.text },
  CmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true },
  CmpItemAbbrMatch = { fg = c.accent, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = c.accent },
  CmpItemMenu = { fg = c.muted },
  CmpItemKind = { fg = c.cyan },
  CmpItemKindFunction = { fg = c.blue },
  CmpItemKindMethod = { fg = c.blue },
  CmpItemKindVariable = { fg = c.text },
  CmpItemKindKeyword = { fg = c.purple },
  CmpItemKindSnippet = { fg = c.green },

  -- Telescope -------------------------------------------------------------------
  TelescopeNormal = { link = "NormalFloat" },
  TelescopeBorder = { link = "FloatBorder" },
  TelescopeTitle = { fg = c.on_accent, bg = c.accent, bold = true },
  TelescopePromptPrefix = { fg = c.accent },
  TelescopeSelection = { bg = c.surface_alt },
  TelescopeSelectionCaret = { fg = c.accent, bg = c.surface_alt },
  TelescopeMatching = { fg = c.accent, bold = true },

  -- which-key, nvim-tree, Mason, Trouble, oil -------------------------------------
  WhichKey = { fg = c.accent },
  WhichKeyGroup = { fg = c.purple },
  WhichKeyDesc = { fg = c.text },
  WhichKeySeparator = { fg = c.muted },
  WhichKeyNormal = { link = "NormalFloat" },
  NvimTreeNormal = { fg = c.text, bg = c.bg_alt },
  NvimTreeWinSeparator = { fg = c.bg_alt, bg = c.bg_alt },
  NvimTreeFolderName = { fg = c.blue },
  NvimTreeOpenedFolderName = { fg = c.blue, bold = true },
  NvimTreeRootFolder = { fg = c.accent, bold = true },
  NvimTreeGitDirty = { fg = c.yellow },
  NvimTreeGitNew = { fg = c.green },
  NvimTreeGitDeleted = { fg = c.red },
  NvimTreeIndentMarker = { fg = c.border },
  MasonHeader = { fg = c.on_accent, bg = c.accent, bold = true },
  MasonHighlight = { fg = c.accent },
  MasonHighlightBlockBold = { fg = c.on_accent, bg = c.accent, bold = true },
  MasonMuted = { fg = c.muted },
  TroubleNormal = { fg = c.text, bg = c.bg_alt },
  OilDir = { fg = c.blue },

  -- Debugger (nvim-dap) -------------------------------------------------------------
  DapBreakpoint = { fg = c.red },
  DapStopped = { fg = c.green },
  DapStoppedLine = { bg = tint(c.green, 0.15) },
}

for name, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, name, spec)
end

-- The 16 terminal colours of :terminal follow the palette, like kitty and foot.
local ansi = { c.ansi_black, c.red, c.green, c.yellow, c.blue, c.purple, c.cyan, c.ansi_white }
local bright = { c.ansi_bright_black, c.red, c.green, c.yellow, c.accent, c.purple, c.cyan, c.ansi_bright_white }
for i = 0, 7 do
  vim.g["terminal_color_" .. i] = ansi[i + 1]
  vim.g["terminal_color_" .. (i + 8)] = bright[i + 1]
end
