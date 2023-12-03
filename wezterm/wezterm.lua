-- Pull in the wezterm API
local wezterm = require("wezterm")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Set Renderer
config.front_end = "WebGpu"

-- Tab bar settings
config.enable_tab_bar = false --set to true if you want to see the tabs

-- Colorscheme
config.color_scheme = "Tokyo Night"

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Window settings
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 60,
  bottom = 0,
}

-- Maximize window on load
wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

return config
