# dwm - Gruvbox Rice

[中文文档](README.zh-CN.md)

Personal build of [dwm 6.5](https://dwm.suckless.org/) with systray patch, Gruvbox color scheme, and custom keybindings.

## Prerequisites

### Hardware

- x86_64 architecture (Arch Linux)
- X11 display server
- Audio card and display backlight for volume/brightness controls

### Build Dependencies

```bash
sudo pacman -S --needed base-devel libx11 libxinerama libxft freetype2 fontconfig
```

### Runtime Dependencies

| Package | Purpose | Required |
|---------|---------|----------|
| kitty | Terminal emulator (Super+Return) | No (configurable in config.def.h) |
| dmenu | Application launcher (Super+p) | No |
| rofi | Application launcher (Super+r) | No |
| pipewire-pulse | Volume control (pactl) | No (needed for volume keys) |
| brightnessctl | Brightness control | No (needed for brightness keys) |
| libnotify | Desktop notifications (notify-send) | No (needed for vol.sh / brightness.sh) |
| dunst | Notification daemon | No (pairs with notify-send) |

### Fonts

Nerd Font variants are required for the tag icons in the bar.

| Font | Usage |
|------|-------|
| ComicShannsMono Nerd Font | Primary bar and dmenu font |
| Microsoft YaHei | CJK fallback |
| Maple Mono NF CN | Additional CJK fallback |

## Installation

```bash
# Clone the repository
git clone git@github.com:ChHsiching/dwm.git
cd dwm

# Build and install (using the install script)
cd scripts && sudo ./install.sh

# Or build manually
make clean install
sudo cp scripts/vol.sh /usr/local/bin/vol.sh
sudo cp scripts/brightness.sh /usr/local/bin/brightness.sh
sudo chmod +x /usr/local/bin/vol.sh /usr/local/bin/brightness.sh
```

### Starting dwm

Add to `~/.xinitrc`:

```bash
exec dwm
```

Then start with `startx`.

## Keybindings

| Key | Action |
|-----|--------|
| Super + Return | Open terminal (kitty) |
| Super + p | Launch dmenu |
| Super + r | Launch rofi |
| Super + q | Kill focused window |
| Super + b | Toggle bar visibility |
| Super + j / k | Focus next / previous window |
| Super + h / l | Shrink / enlarge master area |
| Super + i / d | Increase / decrease master count |
| Super + z | Zoom (swap focused with master) |
| Super + Tab | View previous tag |
| Super + t / f / m | Set layout: tile / floating / monocle |
| Super + Space | Cycle layouts |
| Super + Shift + Space | Toggle floating |
| Super + 1-9 | Switch to tag 1-9 |
| Super + Shift + 1-9 | Move window to tag 1-9 |
| Super + Shift + q | Quit dwm |
| Volume Up / Down / Mute | Volume control + notification |
| Brightness Up / Down | Brightness control + notification |

## Project Structure

```
dwm/
├── config.def.h          # Configuration (edit this, not config.h)
├── config.mk             # Build configuration
├── dwm.c                 # Main source (with patches applied)
├── drw.c / drw.h         # Drawing library
├── util.c / util.h        # Utilities
├── patches/
│   ├── dwm-patches.diff      # dwm.c diff from upstream
│   └── config-patches.diff   # config.def.h diff from upstream
├── scripts/
│   ├── install.sh        # Build, install, deploy scripts
│   ├── vol.sh            # Volume notification for dunst
│   ├── brightness.sh     # Brightness notification for dunst
│   ├── patch.sh          # Apply patches
│   ├── unpatch.sh        # Revert patches
│   ├── backup.sh         # Backup configuration
│   └── restore.sh        # Restore from backup
└── wallpapers/           # Wallpaper files
```

## Modifying Configuration

1. Edit `config.def.h`
2. Rebuild: `rm config.h && make clean && make`
3. Install: `sudo make install`
4. Restart dwm

## Acknowledgments

- [suckless.org](https://suckless.org/) - dwm authors
- [Gruvbox](https://github.com/morhetz/gruvbox) - Color scheme inspiration
