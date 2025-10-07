-- let the width of neo-tree change with the width of window, always be 20% of window width
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    require('neo-tree.command').execute { action = 'close' }
    require('neo-tree.command').execute { action = 'show', soure = 'filesystem', reveal = true }
  end,
})

-- let nvim open neo-tree rather than netrw when I type `nvim <dirname>`
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local stat = vim.loop.fs_stat(vim.fn.argv(0))
    if stat and stat.type == 'directory' then
      -- ban netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change to the directory
      vim.cmd('cd ' .. vim.fn.argv(0))

      -- open neo-tree
      vim.cmd 'Neotree reveal'
    end
  end,
})
