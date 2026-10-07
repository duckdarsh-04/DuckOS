{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.extraLuaFiles."main.lua".text = ''
    -- Monitor
    hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

    -- Autostart
    local autostart = {
      "kitty",
      "waybar",
      "awww-daemon",
      "awww img ~/wallpapers/wallhaven-3lgxx3_1920x1080.png --transition-type slide --transition-fps 60",
      "swayosd-server",
      "hypridle",
      "wl-paste --type text --watch cliphist store",
      "wl-paste --type image --watch cliphist store",
    }

    hl.on("hyprland.start", function()
      for _, cmd in ipairs(autostart) do
        hl.exec_cmd(cmd)
      end
    end)

    -- Environment
    hl.env("XCURSOR_SIZE", "42")
    hl.env("HYPRCURSOR_SIZE", "42")

    -- Master layout
    hl.config({ master = { new_status = "master" } })

    -- Per-device input
    hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

    -- Window rules
    hl.window_rule({
      name = "suppress-maximize-events",
      match = { class = ".*" },
      suppress_event = "maximize",
    })

    hl.window_rule({
      name = "fix-xwayland-drags",
      match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
      },
      no_focus = true,
    })
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    plugins = [
      #pkgs.hyprlandPlugins.hyprspace
    ];
  };

  imports = [
    ./animations-lua.nix
    ./settings-lua.nix
    ./keybindings-lua.nix
  ];
}
