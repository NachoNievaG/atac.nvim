local Terminal = require("toggleterm.terminal").Terminal

local M = require("atac.config")

local atac_term = nil -- Store the terminal object

--- Toggle the Atac terminal
-- @return nil
-- @usage require("atac.ui").toggle_atac_terminal()
function M.toggle_atac_terminal()
	if atac_term and atac_term:is_open() then
		atac_term:close()
		atac_term = nil
	else
		-- Create a floating terminal pane and run a custom command
		atac_term = Terminal:new({
			cmd = "atac -d " .. M.options.dir,
			hidden = true,
			direction = "float",
			float_opts = { border = "double" },
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})
		return atac_term:toggle()
	end
end

return M
