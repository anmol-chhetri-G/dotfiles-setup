<div align="center">

# 🚀 Dotfiles Setup

### *Automate Your Linux Environment*

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Shell](https://img.shields.io/badge/shell-bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/platform-Linux-orange.svg)](https://www.linux.org/)
[![Arch](https://img.shields.io/badge/Arch-supported-1793D1.svg?logo=arch-linux)](https://archlinux.org/)
[![Debian](https://img.shields.io/badge/Debian-supported-A81D33.svg?logo=debian)](https://www.debian.org/)

<p align="center">
  <img src="https://user-images.githubusercontent.com/74038190/212284100-561aa473-3905-4a80-b561-0d28506553ee.gif" width="700">
</p>

*One script to rule them all - deploy your entire development setup in minutes*

[Features](#-features) • [Quick Start](#-quick-start) • [Installation](#-installation) • [Customization](#-customization) • [Support](#-support)

</div>

---

## 📖 Table of Contents

- [Features](#-features)
- [Quick Start](#-quick-start)
- [Installation](#-installation)
- [What Gets Installed](#-what-gets-installed)
- [Project Structure](#-project-structure)
- [Customization](#-customization)
- [NeoVim Configuration](#-neovim-configuration)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features

<table>
  <tr>
    <td align="center">🎯</td>
    <td><b>Smart Detection</b><br/>Automatically detects your Linux distribution and package manager</td>
  </tr>
  <tr>
    <td align="center">📦</td>
    <td><b>Modular Design</b><br/>Clean, maintainable code split into logical modules</td>
  </tr>
  <tr>
    <td align="center">⚡</td>
    <td><b>One Command Setup</b><br/>Complete development environment in a single command</td>
  </tr>
  <tr>
    <td align="center">🎨</td>
    <td><b>NeoVim Ready</b><br/>Pre-configured NeoVim setup with Packer and plugins</td>
  </tr>
  <tr>
    <td align="center">🔧</td>
    <td><b>Highly Customizable</b><br/>Easy-to-edit configuration files for your preferences</td>
  </tr>
  <tr>
    <td align="center">🛡️</td>
    <td><b>Safe & Smart</b><br/>Backup existing configs before overwriting</td>
  </tr>
</table>

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/anmol-chhetri-G/dotfiles-setup.git
cd dotfiles-setup

# Make scripts executable
chmod +x setup.sh scripts/*.sh

# Run the setup
./setup.sh
```

That's it! The interactive installer will guide you through the rest.

---

## 💻 Installation

### Prerequisites

- A Linux distribution (Arch-based or Debian-based)
- `git` installed
- `sudo` privileges
- Internet connection

### Step-by-Step

1. **Clone the repository**
   ```bash
   git clone https://github.com/anmol-chhetri-G/dotfiles-setup.git
   cd dotfiles-setup
   ```

2. **Review the configuration** (Optional but recommended)
   ```bash
   cat config/main-apps.txt
   ```

3. **Make scripts executable**
   ```bash
   chmod +x setup.sh scripts/*.sh
   ```

4. **Run the installer**
   ```bash
   ./setup.sh
   ```

5. **Follow the interactive prompts**
   - Update system? (y/n)
   - Install applications? (y/n)
   - Setup NeoVim? (y/n)

---

## 📦 What Gets Installed

### 🛠️ Essential Tools
- `git`, `curl`, `wget`, `base-devel`
- `unzip`, `unrar`, `p7zip`

### 🖥️ System Utilities
- `neofetch`, `htop`, `tmux`
- `tealdeer` (tldr pages)

### 💻 Development Tools
- `nvim` (NeoVim)
- `python3`, `python3-pip`
- `go` (Golang)
- `code` (VS Code)

### 🌐 Browsers & Apps
- `firefox`, `chromium`, `google-chrome-stable`
- `obsidian` (Note-taking)
- `kitty` (Terminal emulator)

### 🎬 Media
- `vlc`, `smplayer`, `ffmpeg`

### 🔐 Security Tools
- `wireshark`
- `ffuf` (Web fuzzer)

### 📝 Office & Productivity
- `onlyoffice-bin`
- `localsend` (File sharing)

*Full list available in [`config/main-apps.txt`](config/main-apps.txt)*

---

## 📁 Project Structure

```
dotfiles-setup/
│
├── 📜 setup.sh                 # Main entry point
│
├── 📂 scripts/
│   ├── utils.sh               # Helper functions & colors
│   ├── detect-system.sh       # OS detection logic
│   ├── system-update.sh       # System update handler
│   ├── install-apps.sh        # Application installer
│   └── setup-nvim.sh          # NeoVim configuration
│
├── 📂 config/
│   └── main-apps.txt          # List of applications to install
│
└── 📂 nvim/                   # NeoVim configuration files
    ├── init.lua               # Main config
    ├── lua/                   # Lua modules
    └── ...
```

---

## 🎨 Customization

### Adding/Removing Applications

Edit `config/main-apps.txt`:

```bash
# Add your favorite apps
neovim
docker
kubernetes-cli

# Comment out apps you don't need
# google-chrome-stable
# onlyoffice-bin
```

### Modifying Installation Behavior

Each script in `scripts/` can be customized independently:

- **`utils.sh`** - Modify colors, add new helper functions
- **`detect-system.sh`** - Add support for new distributions
- **`install-apps.sh`** - Change installation logic
- **`setup-nvim.sh`** - Customize NeoVim setup process

### Running Individual Modules

You can source and run individual functions:

```bash
source scripts/utils.sh
source scripts/detect-system.sh

detect_system
info "System detected: $PM"
```

---

## ⚙️ NeoVim Configuration

### What's Included

- **Plugin Manager**: Packer.nvim
- **Color Scheme**: Tokyo Night
- **File Explorer**: nvim-tree
- **Syntax Highlighting**: Treesitter
- **Icons**: nvim-web-devicons

### Backup Policy

Your existing NeoVim config is automatically backed up:

```
~/.config/nvim → ~/.config/nvim.backup.YYYYMMDD_HHMMSS
```

### Manual NeoVim Setup

```bash
source scripts/utils.sh
source scripts/setup-nvim.sh

setup_neovim
```

---

## 🐛 Troubleshooting

### Permission Denied Errors

```bash
# Make scripts executable
chmod +x setup.sh scripts/*.sh
```

### Package Not Found

Some packages may have different names on different distributions. Edit `config/main-apps.txt` to use the correct package name for your system.

### NeoVim Plugins Not Installing

```bash
# Manually sync plugins
nvim +PackerSync
```

### Git Clone Fails

Ensure you have SSH keys set up or use HTTPS:
```bash
git clone https://github.com/anmol-chhetri-G/dotfiles-setup.git
```

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Ideas for Contributions

- 🎯 Support for more Linux distributions (Fedora, openSUSE)
- 🛠️ Additional setup modules (zsh, tmux, i3, etc.)
- 📝 Improved documentation
- 🐛 Bug fixes and improvements
- 🎨 Better NeoVim configurations

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💖 Support

If you find this project helpful, consider:

- ⭐ Starring the repository
- 💡 Suggesting new features
- 🤝 Contributing to the code

---

<div align="center">

### 🌟 Show Your Support

**Star this repo** if it helped you set up your Linux environment!

<p align="center">
  <img src="https://user-images.githubusercontent.com/74038190/212284115-f47cd8ff-2ffb-4b04-b5bf-4d1c14c0247f.gif" width="400">
</p>

**Made with ❤️ by [anmol-chhetri-G](https://github.com/anmol-chhetri-G)**

</div>
