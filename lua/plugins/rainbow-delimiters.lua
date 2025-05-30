return {
  "hiphish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require('rainbow-delimiters')
    
    require('rainbow-delimiters.setup').setup({
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        -- 这里定义不同层级的颜色
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    })
  end
}
