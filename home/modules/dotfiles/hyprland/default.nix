{
  pkgs,
  config,
  lib,
  ...
}:
{
  #Enable hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    plugins = [
      #pkgs.hyprlandPlugins.hyprspace
    ];

    settings = {
      monitor = [
        ",preferred,auto,auto"
        "HDMI-A-1, preferred,auto, 1, mirror, eDP-1"
      ];

      #Programs
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";
      "$mainMod" = "SUPER";

      exec-once = [
        "$terminal"
        "waybar"
        "awww-daemon"
        "awww img ~/wallpapers/wallhaven-3lgxx3_1920x1080.png --transition-type slide --transition-fps 60"
        "hypridle"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "solaar --window=hide"
      ];

      #Environment
      env = [
        "XCURSOR_SIZE,42"
        "HYPRCURSOR_SIZE,42"
      ];

      #dwindle = {
      #pseudotile = true;
      #preserve_split = true;
      #};

      master = {
        new_status = "master";
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      windowrule = [
        "suppress_event maximize, match:class .*"
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"

      ];
    };
  };

  imports = [
    ./settings.nix
    ./animations.nix
    ./keybindings.nix
  ];

}
