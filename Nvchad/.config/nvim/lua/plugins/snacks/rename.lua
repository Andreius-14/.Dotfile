local M = {}

M.keys = {}

-- Opcional: una función setup si necesitas config extra para image
M.setup = function(opts)
	-- Configuración específica para image, si es necesario
	-- Aquí va el autocmd para integración con nvim-tree
	local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
	vim.api.nvim_create_autocmd("User", {
		pattern = "NvimTreeSetup",
		callback = function()
			local events = require("nvim-tree.api").events
			events.subscribe(events.Event.NodeRenamed, function(data)
				if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
					prev.new_name = data.new_name -- Actualiza prev para evitar duplicados
					prev.old_name = data.old_name
					require("snacks").rename.on_rename_file(data.old_name, data.new_name)
				end
			end)
		end,
	})
end

return M
