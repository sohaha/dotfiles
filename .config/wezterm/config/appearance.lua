local wezterm = require("wezterm")
-- local colors = require("colors.custom")
-- local fonts = require('config.fonts')
local platform = require("utils.platform")()

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Gruvbox dark, medium (base16)"
  else
    return "Selenized Light (Gogh)"
  end
end

local button_style = "Windows"
if platform.is_mac then
  button_style = "MacOsNative"
end

return {
  term = "xterm-256color",
  animation_fps = 60,
  -- max_fps = 60,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",

  color_scheme = scheme_for_appearance(get_appearance()),
  -- background
  -- window_background_opacity = 0.98,
  win32_system_backdrop = "Acrylic",
  -- window_background_gradient = {
  --   colors = { "#1D261B", "#261A25" },
  --   -- Specifices a Linear gradient starting in the top left corner.
  --   orientation = { Linear = { angle = -45.0 } },
  -- },
  background = {
    {
      source = { File = wezterm.config_dir .. "/backdrops/space.jpg" },
    },
    {
      source = { Color = "#fdf5e0" },
      height = "100%",
      width = "100%",
      opacity = 0.90,
    },
  },

  -- scrollbar
  enable_scroll_bar = true,
  min_scroll_bar_height = "3cell",
  colors = {
    -- scrollbar_thumb = "#34354D",
  },

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = true,
  tab_max_width = 30,
  -- show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  cursor_blink_rate = 700,

  -- window
  adjust_window_size_when_changing_font_size = false,
  -- window_decorations = "RESIZE",
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  -- integrated_title_button_style = "Windows",
  integrated_title_button_style = button_style,
  integrated_title_button_color = "auto",
  integrated_title_button_alignment = "Right",
  initial_cols = 120,
  initial_rows = 24,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- show_status_at_bottom = false,
  window_close_confirmation = "AlwaysPrompt",
  window_frame = {
    -- active_titlebar_bg = "#0F2536",
    -- inactive_titlebar_bg = "#0F2536",
    -- font = fonts.font,
    -- font_size = fonts.font_size,
  },
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
