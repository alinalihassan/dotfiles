-- Pull in the wezterm API
local wezterm = require("wezterm")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

-- Set Renderer
config.front_end = "WebGpu"

-- Tab bar settings
config.enable_tab_bar = false --set to true if you want to see the tabs

-- Colorscheme
config.color_scheme = "Tokyo Night"

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Disable audible bell
config.audible_bell = "Disabled"

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

-- Keybindings
-- Disable default keybindings
config.disable_default_key_bindings = true

-- Setup Leader key for tmux-like panel and window management
-- config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- Tab/Window Management
  { key = 'Tab',        mods = 'CTRL',       action = act.ActivateTabRelative(1) },
  { key = 'Tab',        mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = '1',          mods = 'SUPER',      action = act.ActivateTab(0) },
  { key = '2',          mods = 'SUPER',      action = act.ActivateTab(1) },
  { key = '3',          mods = 'SUPER',      action = act.ActivateTab(2) },
  { key = '4',          mods = 'SUPER',      action = act.ActivateTab(3) },
  { key = '5',          mods = 'SUPER',      action = act.ActivateTab(4) },
  { key = '6',          mods = 'SUPER',      action = act.ActivateTab(5) },
  { key = '7',          mods = 'SUPER',      action = act.ActivateTab(6) },
  { key = '8',          mods = 'SUPER',      action = act.ActivateTab(7) },
  { key = '9',          mods = 'SUPER',      action = act.ActivateTab(-1) },
  -- Copy Paste
  { key = 'c',          mods = 'SUPER',      action = act.CopyTo 'Clipboard' },
  { key = 'v',          mods = 'SUPER',      action = act.PasteFrom 'Clipboard' },
  -- Command-based keybindings
  { key = 'f',          mods = 'SUPER',      action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'k',          mods = 'SUPER',      action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'n',          mods = 'SUPER',      action = act.SpawnWindow },
  { key = 'q',          mods = 'SUPER',      action = act.QuitApplication },
  { key = 'r',          mods = 'SUPER',      action = act.ReloadConfiguration },
  { key = 't',          mods = 'SUPER',      action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w',          mods = 'SUPER',      action = act.CloseCurrentTab { confirm = true } },
  -- Panel keybindings
  { key = '\\',         mods = 'LEADER',     action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-',          mods = 'LEADER',     action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '-',          mods = 'SUPER',      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '\\',         mods = 'SUPER',      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'LeftArrow',  mods = 'ALT',        action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT',        action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT',        action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'ALT',        action = act.ActivatePaneDirection 'Down' },
  { key = 'LeftArrow',  mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Left', 2 } },
  { key = 'RightArrow', mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Right', 2 } },
  { key = 'UpArrow',    mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Up', 2 } },
  { key = 'DownArrow',  mods = 'SHIFT|ALT',  action = act.AdjustPaneSize { 'Down', 2 } },
  -- Other
  { key = 'P',          mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  { key = 'k',          mods = 'SUPER',      action = act.ActivateCommandPalette },
  { key = 'U',          mods = 'SHIFT|CTRL', action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
  { key = 'X',          mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  { key = 'Z',          mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
}

return config
