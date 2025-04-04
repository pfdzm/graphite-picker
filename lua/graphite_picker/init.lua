local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local graphite_picker = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Graphite Branches",
			finder = finders.new_oneshot_job({ "gt", "ls", "--no-interactive", "--reverse" }, {
				entry_maker = function(entry)
					-- Remove everything before the last space, if any
					local trimmed_value = entry:match(".*%s(.+)$") or entry
					return {
						value = trimmed_value,
						display = entry,
						ordinal = entry,
					}
				end,
			}),

			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if not selection then
						return
					end
					vim.fn.system({ "gt", "co", "--quiet", selection.value })
				end)
				return true
			end,
		})
		:find()
end

return graphite_picker
