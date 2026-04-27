local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- --- Appearance ---
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 13.0
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 10000

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
  options = {
    theme = config.color_scheme,
    icons_enabled = true,
    tabs_enabled = true,
    section_separators = "",
    component_separators = "",
    tab_separators = "",
  },
  sections = {
    tabline_a = { "mode" },
    tabline_b = { "workspace" },
    tabline_c = { " " },
    tab_active = {
      { "cwd", padding = { left = 2, right = 2 } },
    },
    tab_inactive = {
      { "cwd", padding = { left = 2, right = 2 } },
    },
    tabline_x = {},
    tabline_y = { { "datetime", style = "%H:%M" } },
    tabline_z = { "hostname" },
  },
})

tabline.apply_to_config(config)

-- remove side padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- --- Tmux-like leader key ---
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- keymaps
config.keys = {
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },
  {
    key = "%",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = '"',
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = "o",
    mods = "LEADER",
    action = wezterm.action.RotatePanes("Clockwise"),
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "H",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "J",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
  },
  {
    key = "K",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
  },
  {
    key = "L",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "0",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(9),
  },
  {
    key = "1",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = "2",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = "3",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = "4",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = "5",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = "6",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = "7",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = "8",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = "9",
    mods = "LEADER",
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = "w",
    mods = "LEADER",
    action = wezterm.action.ShowLauncherArgs({ flags = "TABS|LAUNCH_MENU_ITEMS" }),
  },
  {
    key = "f",
    mods = "LEADER",
    action = wezterm.action.PaneSelect,
  },
  {
    key = "[",
    mods = "LEADER",
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = "r",
    mods = "LEADER",
    action = wezterm.action.ReloadConfiguration,
  },
}

-- --- Performance ---
config.front_end = "WebGpu" -- Faster rendering on modern GPUs

return config
