{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.extraLuaFiles."keybindings.lua".text = ''
    local mainMod     = "SUPER"
    local terminal    = "kitty"
    local fileManager = "thunar"
    local menu        = "rofi -show drun"

    -- Main bindings
    hl.bind(mainMod .. " + RETURN",       hl.dsp.exec_cmd(terminal))
    hl.bind(mainMod .. " + Q",            hl.dsp.window.kill())
    hl.bind(mainMod .. " + SHIFT + E",    hl.dsp.exit())
    hl.bind(mainMod .. " + F",            hl.dsp.exec_cmd(fileManager))
    hl.bind(mainMod .. " + V",            hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + D",            hl.dsp.exec_cmd(menu))
    hl.bind(mainMod .. " + P",            hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))

    -- Custom scripts and tools
    hl.bind(mainMod .. " + SHIFT + W",    hl.dsp.exec_cmd("/etc/nixos/home/modules/dotfiles/hyprland/scripts/wallpaper.sh"))
    hl.bind(mainMod .. " + SHIFT + X",    hl.dsp.exec_cmd("wlogout"))
    hl.bind(mainMod .. " + S",            hl.dsp.exec_cmd("hyprshot -m window | wl-copy"))
    hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.exec_cmd("hyprshot -m region | wl-copy"))
    hl.bind(mainMod .. " + SHIFT + F",    hl.dsp.window.fullscreen({ action = "toggle" }))
    hl.bind(mainMod .. " + L",            hl.dsp.exec_cmd("hyprlock"))
    hl.bind(mainMod .. " + SHIFT + C",    hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

    -- Layout messages (master layout: colresize / swapcol / move)
    hl.bind(mainMod .. " + period",         hl.dsp.layout("colresize +0.1"))
    hl.bind(mainMod .. " + CTRL + period",  hl.dsp.layout("colresize -0.1"))
    hl.bind(mainMod .. " + comma",          hl.dsp.layout("swapcol l"))
    hl.bind(mainMod .. " + period",         hl.dsp.layout("swapcol r"))
    hl.bind(mainMod .. " + SHIFT + comma",  hl.dsp.layout("move l"))
    hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("move r"))

    -- Focus movement
    hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

    -- Workspace switching + move-to-workspace (1-10)
    for i = 1, 10 do
      local key = i % 10
      hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i }))
      hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
    end

    -- Scratchpad
    hl.bind(mainMod .. " + grave",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Workspace scrolling
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

    -- Mouse bindings (drag move/resize)
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Volume / brightness (repeatable + locked)
    local mediaKeys = {
      { key = "XF86AudioRaiseVolume",   cmd = "swayosd-client --output-volume raise" },
      { key = "XF86AudioLowerVolume",   cmd = "swayosd-client --output-volume lower" },
      { key = "XF86AudioMute",          cmd = "swayosd-client --output-volume mute-toggle" },
      { key = "XF86AudioMicMute",       cmd = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" },
      { key = "XF86MonBrightnessUp",    cmd = "swayosd-client --brightness raise" },
      { key = "XF86MonBrightnessDown",  cmd = "swayosd-client --brightness lower" },
      { key = "XF86KbdBrightnessUp",    cmd = "asusctl -n" },
      { key = "XF86KbdBrightnessDown",  cmd = "asusctl -p" },
      { key = "XF86Launch3",            cmd = "asusctl aura -n" },
      { key = "XF86Launch4",            cmd = "asusctl profile -n && notify-send 'Profile' \"$(asusctl profile -p | grep 'Active profile' | awk '{print $NF}')\"" },
      { key = "XF86Launch1",            cmd = "rog-control-center" },
    }

    for _, bind in ipairs(mediaKeys) do
      hl.bind(bind.key, hl.dsp.exec_cmd(bind.cmd), { repeating = true, locked = true })
    end

    -- Media playback (non-repeatable, locked)
    local mediaControls = {
      { key = "XF86AudioNext",  cmd = "playerctl next" },
      { key = "XF86AudioPause", cmd = "playerctl play-pause" },
      { key = "XF86AudioPlay",  cmd = "playerctl play-pause" },
      { key = "XF86AudioPrev",  cmd = "playerctl previous" },
    }

    for _, bind in ipairs(mediaControls) do
      hl.bind(bind.key, hl.dsp.exec_cmd(bind.cmd), { locked = true })
    end
  '';
}
