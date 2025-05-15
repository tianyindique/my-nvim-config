-- A variant to save the state of last engine  
local last_ibus_engine = nil

-- get the input method now
local function get_current_engine()
    return vim.fn.system("ibus engine"):gsub("%s+", "")  -- remove the line feed and blank
end

-- Set the IBUS engine
local function set_ibus_engine(engine)
    if engine and engine ~= "" then
        vim.fn.system({ "ibus", "engine", engine })
    end
end

-- change to English when nvim switch to Normal mode
vim.api.nvim_create_autocmd({"InsertLeave", "FocusGained"}, {
    callback = function()
        last_ibus_engine = get_current_engine()
        set_ibus_engine("xkb:us::eng")
    end,
})

-- Change to the previous engine when nvim switch to Normal mode
vim.api.nvim_create_autocmd({"InsertEnter", "FocusLost"}, {
    callback = function()
        if last_ibus_engine and last_ibus_engine ~= "xkb:us::eng" then 
            set_ibus_engine(last_ibus_engine)
        end
    end,
})

-- Set the Input method to last_ibus_engine
vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        set_ibus_engine(last_ibus_engine)
    end,
})
