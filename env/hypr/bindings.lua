-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Applications ---------------------------------------------------------------

-- Quattro's default for SUPER + SHIFT + W is Omawrite, so unbind it first.
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })

-- SUPER + SPACE is the keyboard layout toggle now, so the Omarchy menu moves to a free key.
o.bind("SUPER + M", "Omarchy menu", "omarchy-menu toggle")

-- Everything else from the old bindings.conf (terminal, tmux, browser, file
-- manager, editor, Spotify, Signal, Obsidian, 1Password, lazydocker, and the
-- ChatGPT / Grok / Calendar / Email / YouTube / WhatsApp / Google Messages /
-- Google Photos / X web apps) now ships as an Omarchy default on the same keys,
-- so those lines are gone rather than lost. See
-- $OMARCHY_PATH/default/hypr/bindings/applications.lua.

-- Keyboard layout ------------------------------------------------------------

-- Cycle between the us and ru layouts set in input.lua. SUPER + SPACE is Mac-style: SUPER
-- is the key next to the spacebar on both keyboards -- physically Alt on the Surface
-- (altwin swap in input.lua), physically Command on the Mac-mode Bluetooth keyboard.
hl.unbind("SUPER + SPACE")
o.bind("SUPER + SPACE", "Switch keyboard layout", "hyprctl switchxkblayout all next")

-- Navigation -----------------------------------------------------------------

-- Vim-style focus movement. SUPER + L defaults to "Toggle workspace layout".
o.bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
hl.unbind("SUPER + L")
o.bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))

-- Examples -------------------------------------------------------------------

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
