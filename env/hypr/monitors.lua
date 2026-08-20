-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- No GDK_SCALE override on purpose. GDK only accepts whole integers, so it
-- cannot express this display's 2.5 scale; forcing 2 makes GTK apps commit
-- buffer_scale=2 and land 1.25x oversized once Hyprland paints them at 2.5.
-- Leaving it unset lets GTK and Firefox negotiate scaling with the compositor
-- (fractional-scale-v1), which is what the pre-quattro config effectively did.
local omarchy_monitor_scale = 2.5

-- Internal panel. The mode is pinned because "preferred" selects 60Hz on this
-- display; 2880x1920@120 is available and is what the old monitors.conf used.
-- Scale 2.5 gives 1152x768 logical pixels.
hl.monitor({
  output = "eDP-1",
  mode = "2880x1920@120",
  position = "auto",
  scale = omarchy_monitor_scale,
})

-- External displays fall back to Hyprland's auto-detection.

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
