for k in pairs(package.loaded) do
    if k:match(".*depths.*") then
        package.loaded[k] = nil
    end
end

local M = {}

function M.setup(opts)
    opts = opts or {}
    local status_ok, depths = pcall(require, "depths.theme")
    if not status_ok then
        vim.notify("depths colorscheme not found!", vim.log.levels.ERROR)
        return
    end

    depths.setup()
end

return M
