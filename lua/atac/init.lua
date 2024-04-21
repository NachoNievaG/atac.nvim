local M = {}

--- Setup the plugin
-- @param options: table - user options
-- @return nil
M.setup = function(options)
	local config = require("atac.config")
	config.setup(options)
end

--- open the atac UI
-- @return nil
M.open = function()
	local open_action = require("atac.actions.open")
	open_action.run()
end

return M
