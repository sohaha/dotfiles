local wezterm = require("wezterm")
local platform = require("utils.platform")

local font = "JetBrainsMono NF"
local font_size = platform().is_mac and 16 or 14

return {
  font = wezterm.font(font),
  font_size = font_size,
  -- font_smoothing = "subpixel",
  -- font_antialias = "grayscale",
  -- font_features = {
  --   liga = true,
  --   clig = true,
  --   dlig = true,
  --   hlig = true,
  -- },
  -- font = wezterm.font_with_fallback({
  --   -- { family = "FiraCode Nerd Font", harfbuzz_features = { "ss02=1", "ss07=1", "ss04=1", "ss03=1", "ss06=1" } },
  --   -- { family = "Fira Code", harfbuzz_features = { "ss02=1", "ss07=1", "ss04=1", "ss03=1", "ss06=1" } },
  --   {
  --     family = "JetBrainsMono NF",
  --     -- harfbuzz_features = { "ss02=1", "ss07=1", "ss04=1", "ss03=1", "ss06=1" },
  --   },
  --   -- {family="Intel One Mono"},
  --   -- { family = "JetBrainsMono Nerd Font" },
  --   "JetBrains Mono",
  --   -- "DejaVuSansM Nerd Font",
  --   -- -- "VictorMono Nerd Font Mono",
  --
  --   -- -- Nonicons, special cool symbols
  --   -- { family = "nonicons",               scale = 1.0 },
  --   -- -- Codicon (vs-code specific)
  --   -- { family = "codicon",                scale = 0.8 },
  --   -- -- Terminal Blocks
  --   -- { family = "LegacyComputing",        scale = 1.1 },
  -- }),
  --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  freetype_load_target = "Light", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = "HorizontalLcd", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
