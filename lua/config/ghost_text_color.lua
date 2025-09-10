-- File: lua/config/ghost_text.lua
-- Configuration for blink.cmp ghost text (inline suggestion in insert mode)
-- Automatically adjusts color based on background (dark/light)

local M = {}

-- Setup autocmd to update ghost text when colorscheme changes
function M.setup()
  vim.cmd [[
    augroup GhostTextHighlight
      autocmd!
      autocmd ColorScheme * lua require('config.ghost_text').update()
    augroup END
  ]]
end

-- Update ghost text highlight based on background color
function M.update()
  local fg
  if vim.o.background == "dark" then
    fg = "#A0A0A0"  -- Light gray for dark background
  else
    fg = "#505050"  -- Dark gray for light background
  end
  vim.cmd(string.format("highlight CmpGhostText guifg=%s gui=italic", fg))
end

-- Initialize
M.setup()

return M

