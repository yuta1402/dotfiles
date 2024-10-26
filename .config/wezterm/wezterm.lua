local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = "Builtin Solarized Dark"

config.font = wezterm.font("Ricty Diminished", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 18

config.hide_tab_bar_if_only_one_tab = true

local act = wezterm.action
config.keys = {
  {
    key = 'h',
    mods = 'CMD',
    action = act.SendKey {
      key = 'h',
      mods = 'ALT',
    },
  },
  {
    key = 'j',
    mods = 'CMD',
    action = act.SendKey {
      key = 'j',
      mods = 'ALT',
    },
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.SendKey {
      key = 'k',
      mods = 'ALT',
    },
  },
  {
    key = 'l',
    mods = 'CMD',
    action = act.SendKey {
      key = 'l',
      mods = 'ALT',
    },
  },
}

config.use_ime = true

return config
