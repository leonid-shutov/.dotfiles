-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    -- US + Russian. Switch layouts with SUPER + SPACE (bound in bindings.lua).
    kb_layout = "us,ru",

    -- Caps Lock acts as Ctrl. Note this replaces Omarchy's default
    -- "compose:caps,shift:both_capslock_cancel", so Caps Lock is no longer the
    -- compose key and Shift+Shift no longer toggles Caps Lock.
    --
    -- Left Alt and Win are swapped so SUPER sits next to the spacebar, matching the
    -- Mac-order Bluetooth keyboard (exempted below). Right Alt is left alone: this
    -- keyboard has no Right Win to swap it with.
    kb_options = "ctrl:nocaps,altwin:swap_lalt_lwin",
  },
})

-- The Bluetooth keyboard pairs in Mac mode (it enumerates as Apple 05AC:024F), so its
-- bottom row is already Ctrl-Option-Command with SUPER next to the spacebar. Skip the
-- global altwin swap here; applying it would move SUPER back onto the outboard key.
-- Per-device kb_options replace the global value rather than merging, so ctrl:nocaps
-- has to be repeated.
hl.device({
  name = "bt-keyboard",
  kb_layout = "us,ru",
  kb_options = "ctrl:nocaps",
})

-- Everything else that used to be in input.conf is now an Omarchy default, so
-- there is no need to repeat it here: repeat_rate = 40, repeat_delay = 250,
-- numlock_by_default = true, touchpad.clickfinger_behavior = true,
-- touchpad.scroll_factor = 0.4, and the terminal scroll_touchpad rules.
-- See $OMARCHY_PATH/default/hypr/input.lua for the full set.

-- Other settings you can override, if you ever want them back:
-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
