local ui = require("atac.ui")

local M = {}

-- @return nil
M.run = function()
	ui.toggle_atac_terminal()
end

return M
