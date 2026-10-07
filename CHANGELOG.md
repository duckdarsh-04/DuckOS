# Changelog

## Unreleased

### 2026-10-07
DuckOS Phase 1 - portability restructure:

- Templated USERNAME, HOSTNAME, HOSTNAMESERVER across the entire flake
- created personal.nix (Gitignored/skip-worktree)+personal.nix.example template
- created .gitignore for the flake
- Restructured diriectory layout:
   - adopted a profile system for easy switching from server to desktop
   - renamed configuration.nix --> desktop.nix & server.nix
   - hardware configs --> were removed from commits & added into gitignore
- updated sops.nix, libvert.nix to use the USERNAME variable
- updated .sops.yaml, flake.lock, flake.nix to match the new structure

Hyprland lua migration (In progress):

- added animations-lua.nix, default-lua.nix, keybindings-lua.nix, settings-lua.nix as
parllel lua versions
- Modified existing Animations.nix, default.nix, keybindings.nix

Other fixes/changes

- hyprlock.nix - templated wallpaper paths
- nvidia.nix - added prime configuration
- nvf.nix - modified

Major system changes:
- updated to the recent version of nixos
- switched from zen to xanmod stable kernal
- added logitech udev rules to enable support for logitech mouse

### 2026-06-15
Major UI improvements
- Overhauled waybar
- added useful waybar modules
- changed theme in stylix from gruvbox to catpuccin mocha due to visibility issues
- Overhauled Rofi
- fixed image not appearing in rofi
- declared rofi css
- added jq package
- removed .rasi files in the directory structure
- other QoL improvements

### 2026-06-05
- Updated to 26.05 in desktop
- changed some package names after the update
- added synfetch
- switched to synfetch at the start instead of neofetch
- added -tmpfs for /tmp
- bash.nix cleanup
- changed syntax in hyprland configuration
- Removed hyprexpo as it was no longer part of nixpkgs
- Removed neofetch as it was no longer part of nixpkgs
- Removed - lolcat, neofetch, hollywood, and other packages as it was bloating the system
- Removed yt-x

### 2026-06-02
- Added Sops integration for server
- Added smartd service for server as an hardisk healthcheck
- Added colmena for better remote management
- modified nvf.nix due evaluvation warnings related to typescript
- modified bash.nix for neofetch to appear only on boot for the server and desktop
- deleted security.nix as it did not serve its purpose
- removed apparmor as it did not work
- modified hardware-configuration.nix to auto mount external drives
- enabled zram on nixos-server

### 2026-05-21
-Added sops-nix to flake input and nixos module
-Created an encrypted secrets/desktop.yaml with user password hash
-Fixed obsidian.nix by removing communityPlugins due to type error
-Added zram
-Switched to zen kernal
-other QoL improvements

### 2026-04-21
Declared obisidan and added a neovim plugin

### 2026-03-13
Quality of life improvements and fixed mimeapps

### 2026-03-04
Added the abitlity to download from stable and unstable branch

### 2026-03-03
tweaks

### 2026-03-03
Tweaks and disk encryption

### 2026-02-26
Sync

### 2026-02-15
further refinements & fixed hyprland plugins

### 2026-02-11
Declared hyprland and further customised neovim

### 2026-01-29
Minor tweaks

### 2025-12-31
happy new year, extra tweaks

### 2025-12-31
further refinements for server

### 2025-12-31
refinements for server side

### 2025-12-30
Rehaul of both desktop and server

### 2025-12-08
added alejandra formatter

### 2025-12-08
removed i3.nix and jellyfin-media-player

### 2025-12-04
fixed hyprland.nix and made improvements

### 2025-12-02
Updated to 25.11

### 2025-11-30
first commit
