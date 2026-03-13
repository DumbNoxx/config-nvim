return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = function()
		local quotes = {
			"GTA VI came out before my Rust program finished compiling. ⏳",
			"Beware of Bugs in the above code; I have only proved it correct, not tried it.",
			"A clever person solves a problem. A wise person avoids it.",
			"Learning to program has no more to do with designing interactive software than learning to touch type has to do with writing poetry.",
			"SQL, Lisp, and Haskell are the only programming languages that I've seen where one spends more time thinking than typing.",
			"Simplicity and elegance are unpopular because they require hard work and discipline to achieve and education to be appreciated.",
			"It is hard to think that a $2 billion company with 4,300-plus people couldn't compete with six people in blue jeans.",
			"No bloat, just clean proofs.",
		}

		return {
			editor = {
				tooltip = function(opts)
					return string.format("Workspace: %s - %s:%s", opts.workspace, opts.cursor_line, opts.cursor_char)
				end,
			},
			text = {
				workspace = function(opts)
					local hour = tonumber(os.date("%H"))
					local status = hour >= 22 and "🌙 Late night coding"
						or hour >= 18 and "🌆 Evening session"
						or hour >= 12 and "☀️ Afternoon coding"
						or hour >= 5 and "🌅 Morning productivity"
						or "🌙 Midnight hacking"

					return string.format("%s: %s", status, opts.filename, opts.cursor_line, opts.cursor_char)
				end,
			},
			assets = {
				[".cr"] = "https://cdn.brandfetch.io/id1na_In-z/w/400/h/400/theme/dark/icon.png?c=1dxbfHSJFAPEGdCLU4o5B",
			},
			idle = {
				enabled = true,
				timeout = 150000,
				show_status = true,
				ignore_focus = true,
				unidle_on_focus = true,
				smart_idle = true,
				details = function(opts)
					return string.format("Taking a break from %s", opts.workspace)
				end,
				state = nil,
				tooltip = "💤",
				icon = require("cord.api.icon").get("idle", "atom"),
			},
			buttons = {
				{
					label = function(opts)
						return opts.repo_url and "View Repository" or "My Website"
					end,
					url = function(opts)
						return opts.repo_url or "https://nxus.pages.dev"
					end,
				},
			},
			hooks = {
				pre_activity = function(opts)
					if vim.b.is_nest then
						-- Detecta si estamos en un workspace de nestjs
						opts.force_filetype = "nest"
					end
					if vim.b.is_angular then
						-- Usamos .module.ts porque el mapping de filetype "angular"
						-- devuelve 'htmlangular' (sin asset). Esto fuerza la clave correcta.
						opts.force_fileext = ".module.ts"
					end
				end,
				post_activity = function(_, activity)
					activity.details = quotes[math.random(#quotes)]
				end,
			},
		}
	end,
}
