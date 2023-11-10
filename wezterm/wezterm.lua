-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
local mux = wezterm.mux

-- Maximize window on load
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- Tab bar settings
config.enable_tab_bar = false
--config.use_fancy_tab_bar = false
--config.tab_bar_at_bottom = true
--config.show_tabs_in_tab_bar = true
--config.show_new_tab_button_in_tab_bar = false

-- Pane settings
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

-- Color settings
config.color_scheme = "tokyonight_night"

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("Cascadia Code")
-- config.font = wezterm.font("Geist Mono")

-- Window settings
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
