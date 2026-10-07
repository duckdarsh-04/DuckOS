{
  config,
  pkgs,
  pkgs-unstable,
  username,
  gitName,
  gitEmail,
  ...
}:
{
  imports = [
    ../modules/dotfiles/bash.nix
    ../modules/dotfiles/kitty.nix
    ../modules/dotfiles/htop.nix
    ../modules/dotfiles/waybar.nix
    ../modules/dotfiles/rofi.nix
    ../modules/dotfiles/ranger.nix
    ../modules/dotfiles/swaync.nix
    ../modules/dotfiles/hyprlock.nix
    ../modules/dotfiles/hypridle.nix
    ../modules/dotfiles/xdg.nix
    ../modules/dotfiles/cava.nix
    #../modules/dotfiles/obsidian.nix
    ../modules/dotfiles/hyprland/default.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  home.packages =
    (with pkgs; [
      aria2
      audacity
      discord
      localsend
      htop
      cmatrix
      brave
      kitty
      kitty-themes
      vlc
      fastfetch
      ranger
      pavucontrol
      starship
      waybar
      rofi
      brightnessctl
      swaybg
      hyprlock
      hypridle
      hyprshot
      wlogout
      awww
      wl-clipboard
      onlyoffice-desktopeditors
      swayosd
      teams-for-linux
      #obsidian
      sl
      magic-wormhole
      amfora
      cava
      swaynotificationcenter
      git
      keepassxc
      cliphist
      wl-clip-persist
      nwg-clipman
      tmux
      zapzap
      telegram-desktop
      imv
      libnotify
      jellyfin-desktop
      fladder

    ])

    ++ (with pkgs-unstable; [
      obsidian
    ]);

  programs.home-manager.enable = true;
  programs.starship.enable = true;
  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
  };
  services.dark-send.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = gitName;
    settings.user.email = gitEmail;
    settings.init.defaultBranch = "main";
    settings.safe.directory = [ "/etc/nixos" ];
  };

  services.swayosd.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.qt.enable = false;
}
