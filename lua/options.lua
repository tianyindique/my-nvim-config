vim.opt.clipboard = 'unnamedplus'  -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 --number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.number = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- Open new horizontal splits below the current window
vim.opt.splitright = true -- Open new vertical splits to the right
vim.opt.termguicolors = true -- enable 24-bit RGB color in the GUI
vim.opt.showmode = false -- we are experienced, we don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

vim.opt.wildmenu = true
vim.opt.wildmode = {"longest:full", "full"}

-- Set Keymap
vim.keymap.set('n', 'H', '0', { noremap = true })
vim.keymap.set('n', 'L', '$', { noremap = true })
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'jj', '<Esc>')


-- Set the conceallevel for Obsidian.md
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.wo.conceallevel = 2
  end,
})

