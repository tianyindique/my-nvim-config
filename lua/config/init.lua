local config_path = vim.fn.stdpath("config") .. "/lua/config"

for _, file in ipairs(vim.fn.readdir(config_path)) do
	if file ~= "init.lua" and file:match("%.lua$") then
		local module_name = "config." .. file:gsub("%.lua$", "")
		local ok, err = pcall(require, module_name)
		if not ok then
			vim.notify("Error loading " .. module_name .. "\n\n" .. err, vim.log.levels.ERROR)
		end
	end
end
