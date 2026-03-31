# dwm - Gruvbox Rice

[English](README.md)

基于 [dwm 6.5](https://dwm.suckless.org/) 的个人配置，应用了 systray 等补丁，使用 Gruvbox 配色方案。

## 前置要求

### 硬件要求

- x86_64 架构（Arch Linux）
- 需要可用的 X11 显示服务器
- 音量/亮度控制需要对应的硬件支持（声卡、屏幕背光）

### 构建依赖

```bash
sudo pacman -S --needed base-devel libx11 libxinerama libxft freetype2 fontconfig
```

### 运行依赖

| 软件包 | 用途 | 必需 |
|--------|------|------|
| kitty | 终端模拟器 (Super+Return) | 否（可在 config.def.h 中替换） |
| dmenu | 应用启动器 (Super+p) | 否 |
| rofi | 应用启动器 (Super+r) | 否 |
| pipewire-pulse | 音量控制 (pactl) | 否（音量快捷键需要） |
| brightnessctl | 亮度控制 | 否（亮度快捷键需要） |
| libnotify | 桌面通知 (notify-send) | 否（vol.sh / brightness.sh 需要） |
| dunst | 通知守护进程 | 否（配合 notify-send 使用） |

### 字体

状态栏和 dmenu 使用了 Nerd Font 图标，需要安装对应字体才能正常显示。

| 字体 | 用途 |
|------|------|
| ComicShannsMono Nerd Font | 主字体（状态栏、dmenu） |
| Microsoft YaHei | 中文回退字体 |
| Maple Mono NF CN | 额外中文回退字体 |

## 安装

```bash
# 克隆仓库
git clone git@github.com:ChHsiching/dwm.git
cd dwm

# 方式一：使用安装脚本（构建 + 安装 + 部署脚本）
cd scripts && sudo ./install.sh

# 方式二：手动构建
make clean install
sudo cp scripts/vol.sh /usr/local/bin/vol.sh
sudo cp scripts/brightness.sh /usr/local/bin/brightness.sh
sudo chmod +x /usr/local/bin/vol.sh /usr/local/bin/brightness.sh
```

### 启动 dwm

在 `~/.xinitrc` 中添加：

```bash
exec dwm
```

然后通过 `startx` 启动。

## 快捷键

| 快捷键 | 功能 |
|--------|------|
| Super + Return | 打开终端 (kitty) |
| Super + p | 打开 dmenu |
| Super + r | 打开 rofi |
| Super + q | 关闭当前窗口 |
| Super + b | 切换状态栏显示 |
| Super + j / k | 切换窗口焦点 |
| Super + h / l | 调整 master 区域大小 |
| Super + i / d | 增减 master 窗口数 |
| Super + z | 放大当前窗口 |
| Super + Tab | 切换到上一个标签 |
| Super + t / f / m | 切换布局：tile / floating / monocle |
| Super + Space | 循环切换布局 |
| Super + Shift + Space | 切换当前窗口浮动状态 |
| Super + 1-9 | 切换到标签 1-9 |
| Super + Shift + 1-9 | 移动窗口到标签 1-9 |
| Super + Shift + q | 退出 dwm |
| 音量增/减/静音键 | 音量控制 + dunst 通知 |
| 亮度增/减键 | 亮度控制 + dunst 通知 |

## 项目结构

```
dwm/
├── config.def.h          # 配置文件（修改此文件，不要直接改 config.h）
├── config.mk             # 构建配置
├── dwm.c                 # 主源码（已应用补丁）
├── drw.c / drw.h         # 绘图库
├── util.c / util.h        # 工具函数
├── patches/
│   ├── dwm-patches.diff      # dwm.c 与 upstream 的差异
│   └── config-patches.diff   # config.def.h 与 upstream 的差异
├── scripts/
│   ├── install.sh        # 构建安装 + 部署脚本
│   ├── vol.sh            # 音量通知脚本
│   ├── brightness.sh     # 亮度通知脚本
│   ├── patch.sh          # 应用补丁
│   ├── unpatch.sh        # 撤销补丁
│   ├── backup.sh         # 备份配置
│   └── restore.sh        # 恢复配置
└── wallpapers/           # 壁纸文件
```

## 修改配置

1. 编辑 `config.def.h`
2. 重新构建：`rm config.h && make clean && make`
3. 安装：`sudo make install`
4. 重启 dwm

## 致谢

- [suckless.org](https://suckless.org/) - dwm 原作者
- [Gruvbox](https://github.com/morhetz/gruvbox) - 配色方案灵感
