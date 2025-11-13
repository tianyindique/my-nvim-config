return {
	"kawre/leetcode.nvim",
	dependencies = {
		-- include a picker of your choice, see picker section for more details
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		-- configuration goes here
		---@type lc.lang
		lang = "cpp",

		cn = { -- leetcode.cn
			enabled = true, ---@type boolean
			translator = true, ---@type boolean
			translate_problems = true, ---@type boolean
		},

		---@type boolean
		image_support = false,
	},
}
