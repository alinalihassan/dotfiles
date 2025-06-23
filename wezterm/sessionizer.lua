local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/opt/homebrew/bin/fd"
local rootPath = "/Users/alinalihassan/Developer"


---@param label string
---@return string
local workspace_formatter = function(label)
	return wezterm.format({
		{ Text = "󱂬: " .. label },
	})
end

M.toggle = function(window, pane)
  local projects = {}

  local success, stdout, stderr = wezterm.run_child_process({
    fd,
    "-HI",
    "-td",
    "^.git$",
    "--max-depth=4",
    "--prune",
    rootPath,
  })

  if not success then
    wezterm.log_error("Failed to run fd: " .. stderr)
    return
  end

  local workspace_set = {}
  for _, workspace in ipairs(wezterm.mux.get_workspace_names()) do
    wezterm.log_info(_ .. " - " .. workspace)
		table.insert(projects, {
			id = workspace,
			label = workspace_formatter(workspace),
		})
    workspace_set[workspace] = true
	end

  for line in stdout:gmatch("([^\n]*)\n?") do
    local path = line:gsub("/.git/$", "")
    -- local label = path:gsub(".*/", "")

    local stylized = wezterm.format {
      { Attribute = { Intensity = "Bold" }},
      { Text = path },
    }

    if not workspace_set[path] then
      table.insert(projects, { label = stylized, id = path })
      workspace_set[path] = true -- Add to set to prevent future duplicates
    end
  end

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          wezterm.log_info("Selected " .. label)
          win:perform_action(
            act.SwitchToWorkspace({ name = id, spawn = { cwd = id } }),
            pane
          )
        end
      end),
      fuzzy = true,
      fuzzy_description = "Select project: ",
      choices = projects,
    }),
    pane
  )
end

return M
