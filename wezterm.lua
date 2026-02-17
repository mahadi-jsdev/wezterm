local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- --- Appearance ---
config.color_scheme = "Gruvbox dark, hard (base16)"
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 13.0
config.window_background_opacity = 1
config.macos_window_background_blur = 15
config.window_decorations = "RESIZE"
config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.9,
	brightness = 0.8,
}

-- remove side padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

--- Tab Bar ---
config.enable_tab_bar = false

-- keymaps
config.keys = {
	-- Show the Launcher (Tab/Pane picker)
	{
		key = "l",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ShowLauncherArgs({ flags = "TABS" }),
	},
}

-- --- Performance ---
config.front_end = "WebGpu" -- Faster rendering on modern GPUs

return config
