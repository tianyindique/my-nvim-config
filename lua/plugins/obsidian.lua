return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- Use latest stable release
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",  -- Optional, for completion
    "nvim-telescope/telescope.nvim", -- Optional, for pickers
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Dropbox/My vault",
      },
    },
    completion = {
      nvim_cmp = true,
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
    },
    new_notes_location = "notes_subdir",
    templates = {
    },
    ui = {
      enable = true,
    },
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix ".md"
    end,
    markdown_link_func = function(opts)
      return require("obsidian.util").markdown_link(opts)
    end,
    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_id_prefix(opts)
    end,
    preferred_link_style = "wiki",
  },
}
