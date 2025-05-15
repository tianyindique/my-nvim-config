
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- 可选: "storm", "moon", "day"
    on_highlights = function(hl, colors)
      hl.MatchParen = {
        bg = colors.bg_highlight, -- 柔和高亮背景
        fg = colors.fg,
        bold = true
      }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
  end
}

