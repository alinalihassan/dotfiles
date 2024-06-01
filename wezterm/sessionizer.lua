local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/opt/homebrew/bin/fd"
local rootPath = "/Users/ahassan18/Developer"

M.toggle = function(window, pane)
  local projects = {}

  -- Default workspace
  table.insert(projects, { label = "~", id = "~" })

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

  for line in stdout:gmatch("([^\n]*)\n?") do
    local path = line:gsub("/.git/$", "")
    local label = path:gsub(".*/", "")

    local stylized = wezterm.format {
      { Attribute = { Intensity = "Bold" }},
      { Text = label },
    }

    table.insert(projects, { label = stylized, id = path })
  end

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          wezterm.log_info("Selected " .. label)
          win:perform_action(
            act.SwitchToWorkspace({ name = label, spawn = { cwd = id } }),
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
