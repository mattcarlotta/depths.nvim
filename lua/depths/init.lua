for k in pairs(package.loaded) do
    if k:match('.*depths.*') then
        package.loaded[k] = nil
    end
end
-- -- init.lua - Entry point for ayu-dark colorscheme
local M = {}

-- Setup and load the colorscheme
function M.setup(opts)
    opts = opts or {}
    -- Try to load the colorscheme
    local status_ok, depths = pcall(require, 'depths.theme')
    if not status_ok then
        vim.notify('dark colorscheme not found!', vim.log.levels.ERROR)
        return
    end

    -- Set up and load the colorscheme
    depths.setup()
    -- vim.api.nvim_command("colorscheme ayu-dark")
end

return M

-- local M = {}

-- function M.setup(opts)
-- 	opts = opts or {}
-- 	-- Store user options or set defaults
-- 	M.options = vim.tbl_deep_extend("force", {
-- 		-- default options here
-- 		greeting = "Hello from my plugin!",
-- 	}, opts)
-- end

-- function M.say_hello()
-- 	print(M.options.greeting)
-- end

-- return M
