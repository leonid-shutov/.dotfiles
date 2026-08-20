-- Desktop layout: what launches at startup, where each app is pinned, and the
-- SUPER + <letter> keys that jump to the lettered workspaces. This is a
-- personal file (not an Omarchy default), so `omarchy refresh hyprland` will
-- never recreate or overwrite it.
--
-- One row per app. `key` is optional; when set, SUPER + <key> focuses that
-- workspace, overriding whatever Omarchy bound the key to. `move_key` binds a
-- second combo that sends the focused window there.

local layout = {
  -- Numbered workspaces
  { ws = "1", class = "kitty", launch = "kitty" },
  { ws = "2", class = "firefox", launch = "firefox" },
  { ws = "3", class = "org.telegram.desktop", launch = "Telegram" },
  { ws = "4", class = "chromium", launch = "chromium" },
  -- Lowercase since the --ozone-platform=wayland flag (see
  -- ~/.config/spotify-flags.conf) made Spotify a native Wayland client; it
  -- reported the XWayland class "Spotify" before that.
  { ws = "5", class = "spotify", launch = "spotify" },

  -- Lettered workspaces
  -- SUPER + P was "Pseudo window".
  { ws = "11", class = "Bitwarden", launch = "bitwarden-desktop", key = "P", name = "Passwords" },
  { ws = "12", class = "chrome-app.hey.com__-Default", webapp = "https://app.hey.com", key = "E", name = "Email" },
  -- No key on purpose: SUPER + H is "Focus left" (bindings.lua). The old config
  -- bound SUPER + H here too, but navigation.conf was sourced later and won, so
  -- this workspace has effectively never had a key.
  { ws = "13", class = "chrome-app.hey.com__calendar_weeks_-Default", webapp = "https://app.hey.com/calendar/weeks/" },
  -- SUPER + C was quattro's "Universal copy", so universal copy is gone here;
  -- plain CTRL + C is unaffected.
  { ws = "14", class = "chrome-claude.ai__-Default", webapp = "https://claude.ai", key = "C", name = "Claude" },
  -- SUPER + S was "Toggle scratchpad". SUPER + ALT + S still moves a window
  -- there, but nothing brings the scratchpad back into view.
  { ws = "15", class = "steam", launch = "steam", key = "S", name = "Steam" },
  { ws = "16", class = "chrome-discord.com__channels_@me-Default", webapp = "https://discord.com/channels/@me", key = "D", name = "Discord" },

  -- Reserved for games: nothing launches or is pinned here, it is only a place
  -- to send a window to. SUPER + SHIFT + A was the ChatGPT web app.
  { ws = "17", key = "A", move_key = "SUPER + SHIFT + A", name = "Games" },
}

for _, app in ipairs(layout) do
  if app.webapp then
    o.exec_on_start(o.launch_webapp(app.webapp))
  elseif app.launch then
    o.launch_on_start(app.launch)
  end

  if app.class then
    o.window(app.class, { workspace = app.ws })
  end

  if app.key then
    hl.unbind("SUPER + " .. app.key)
    o.bind("SUPER + " .. app.key, app.name .. " workspace", hl.dsp.focus({ workspace = app.ws }))
  end

  if app.move_key then
    hl.unbind(app.move_key)
    o.bind(app.move_key, "Move window to " .. app.name .. " workspace", hl.dsp.window.move({ workspace = app.ws }))
  end
end
