function Linemode:size_and_mtime()
  local time = math.floor(self._file.cha.modified or 0)
  if time == 0 then
    time = ""
  elseif os.date("%Y", time) == os.date("%Y") then
    time = os.date("%m.%d %H:%M", time)
  else
    time = os.date("%m.%d %Y", time)
  end

  local size = self._file:size()
  return ui.Line(
    string.format("%s %s", size and ya.readable_size(size) or "-", time)
  )
end

require("git"):setup()
require("nvim"):setup()
require("preview-visibility"):setup()
require("full-border"):setup({
  type = ui.Border.ROUNDED,
})

require("projects"):setup({
    save = {
        method = "yazi", -- yazi | lua
        lua_save_path = "", -- windows: "%APPDATA%/yazi/state/projects.json", unix: "~/.config/yazi/state/projects.json"
    },
    last = {
        update_after_save = true,
        update_after_load = true,
    },
    merge = {
        quit_after_merge = false,
    },
    notify = {
        enable = true,
        title = "Projects",
        timeout = 3,
        level = "info",
    },
})

function Status:name()
  local h = self._tab.current.hovered
  if not h then
    return ui.Line {}
  end

  local linked = ""
  if h.link_to ~= nil then
    linked = " -> " .. tostring(h.link_to)
  end
  return ui.Line(" " .. h.name .. linked)
end

Header:children_add(function()
  if ya.target_family() ~= "unix" then
    return ui.Line {}
  end
  return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
