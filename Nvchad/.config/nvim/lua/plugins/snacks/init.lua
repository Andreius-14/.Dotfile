--  ╭─────────────────────────────────────────────────────────╮
--  │                   Habilitar Shortcut                    │
--  ╰─────────────────────────────────────────────────────────╯
-- -- En lua/plugins/snacks.lua
-- local group_shortcuts = { -- El "envoltorio" con submódulos
-- 	require("plugins.snacks.shortcuts").keys,
-- 	require("plugins.snacks.image").keys,
-- 	require("plugins.snacks.rename").keys,
-- 	-- etc.
-- }
-- local shortcuts = vim.iter(group_shortcuts):flatten(1):totable()

--  ╭─────────────────────────────────────────────────────────╮
--  │                    Habilitar Plugin                     │
--  ╰─────────────────────────────────────────────────────────╯
return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		priority = 1000,
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- bigfile = { enabled = true },
			-- dashboard = { enabled = true },
			-- explorer = { enabled = true },
			-- indent = { enabled = true },
			-- input = { enabled = true },
			picker = { enabled = true },
			-- notifier = { enabled = true },
			-- quickfile = { enabled = true },
			-- scope = { enabled = true },
			-- scroll = { enabled = true },
			-- statuscolumn = { enabled = true },
			words = { enabled = true },
			rename = { enabled = true }, -- Asegúrate de agregar esto si no lo tienes

			image = {
				enabled = true,

				-- resolve = function(path, src)
				-- 	local api = require("obsidian.api")
				--
				-- 	if api.path_is_note(path) then
				-- 		return api.resolve_attachment_path(src)
				-- 	end
				--
				-- 	-- Para archivos fuera del vault, dejar la resolución
				-- 	-- predeterminada de Snacks.
				-- 	return nil
				-- end,

				--          ╭─────────────────────────────────────────────────────────╮
				--          │                      timeout 1000                       │
				--          ╰─────────────────────────────────────────────────────────╯
				-- resolve = function(path, src)
				-- 	local api = require("obsidian.api")
				-- 	if not api.path_is_note(path) then
				-- 		return nil
				-- 	end
				--
				-- 	local attachment = require("obsidian.attachment")
				-- 	local resolved = attachment._resolve(src, { filename = path })
				--
				-- 	if resolved then
				-- 		return resolved
				-- 	end
				--
				-- 	-- fallback
				-- 	return api.resolve_attachment_path(src)
				-- end,
				--          ╭─────────────────────────────────────────────────────────╮
				--          │                   Solucion Recursiva.                   │
				--          ╰─────────────────────────────────────────────────────────╯
				resolve = function(path, src)
					local api = require("obsidian.api")
					if not api.path_is_note(path) then
						return nil
					end

					local workspace = tostring(api.resolve_workspace_dir(path))
					local basename = vim.fs.basename(src)

					-- 1. ruta tal cual (si el markdown ya trae subcarpeta)
					local direct = vim.fs.joinpath(workspace, src)
					if vim.uv.fs_stat(direct) then
						return direct
					end

					-- 2. carpeta de attachments configurada
					local configured = api.resolve_attachment_path(src)
					if configured and vim.uv.fs_stat(configured) then
						return configured
					end

					-- 3. buscar solo bajo attachments/ (incluye subcarpetas)
					local attachments_root = vim.fs.joinpath(workspace, "attachments")
					local found = vim.fs.find(basename, {
						path = attachments_root,
						type = "file",
						limit = 1,
					})

					if found and found[1] then
						return found[1]
					end

					return configured
				end,
				formats = {
					"png",
					"jpg",
					"jpeg",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
				},
				sbled = true,tyles = {
					snacks_image = {
						relative = "editor", -- ← esto es lo importante
						border = "rounded", -- o true
						focusable = false,
						backdrop = false,
						-- Posición centrada:
						row = 0.5, -- 0.5 = centro vertical
						col = 0.5, -- 0.5 = centro horizontal
						-- O si prefieres arriba a la derecha:
						-- row = 1,
						-- col = -1,
					},
				},
				doc = {
					enabled = true,
					inline = false,
					float = true,
					max_width = 80,
					max_height = 40,
					only_render_image_at_cursor = false,
					border = true,
					focusable = false,
					backdrop = false,
					-- position = "center",

				},
			},
		},
		-- keys = shortcuts,
		keys = require("plugins.snacks.shortcuts").keys,

		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end

					-- Override print to use snacks for `:=` command
					if vim.fn.has("nvim-0.11") == 1 then
						vim._print = function(_, ...)
							dd(...)
						end
					else
						vim.print = _G.dd
					end

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ug")
					Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,

		config = function(_, opts)
			-- 1. Obligatorio: Ejecutar la configuración de snacks pasando tus opts de arriba
			require("snacks").setup(opts)

			-- 2. Tu configuración personalizada para el renombrado
			require("plugins.snacks.rename").setup()
		end,
	},
}
