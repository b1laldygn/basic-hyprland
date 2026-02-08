NOTE: THIS SCRIPT CREATES ANOTHER DESKTOP FILE !!!


# 📝 Hyprland Basic Edition

This repository contains a minimalist, lightweight Hyprland session configuration that lives alongside your main Quickshell setup.

---

## 🇹🇷 Türkçe

### 🚀 Hakkında

Bu yapılandırma, Quickshell veya ağır widget'lar içermeyen, tamamen hafif araçlara (`waybar`, `wofi`, `foot`) dayalı ikinci bir Hyprland oturumu oluşturur. Hızlı, sade ve iş odaklıdır.

### 🛠️ Kullanılan Araçlar

* **Bar:** Waybar (Minimal panel)
* **Başlatıcı:** Wofi (Dmenu tarzı uygulama başlatıcı)
* **Terminal:** Foot (Hızlı ve hafif Wayland terminali)
* **Tarayıcı:** Brave
* **Dosya Yöneticisi:** Dolphin
* **Bildirimler:** Mako

### ⌨️ Temel Kısayollar

| Kısayol | İşlem |
| --- | --- |
| `SUPER + T` | Terminali Aç (Foot) |
| `SUPER + Q` | Pencereyi Kapat |
| `SUPER + D` | Uygulama Menüsü (Wofi) |
| `SUPER + B` | İnternet Tarayıcısı (Brave) |
| `SUPER + E` | Dosya Yöneticisi (Dolphin) |
| `SUPER + F` | Tam Ekran Modu |
| `SUPER + M` | Hyprland Oturumundan Çık |
| `SUPER + 1-9` | Çalışma Alanları Arasında Geçiş |
| `SUPER+SHIFT + 1-9` | Pencereyi Çalışma Alanına Taşı |

---

## 🇺🇸 English

### 🚀 About

This setup creates a second, minimalist Hyprland session based on lightweight tools (`waybar`, `wofi`, `foot`), bypassing Quickshell or heavy widgets. It's designed for speed and simplicity.

### 🛠️ Components

* **Bar:** Waybar (Minimal panel)
* **Launcher:** Wofi (Dmenu-style app launcher)
* **Terminal:** Foot (Fast and lightweight Wayland terminal)
* **Browser:** Brave
* **File Manager:** Dolphin
* **Notifications:** Mako

### ⌨️ Keybindings

| Shortcut | Action |
| --- | --- |
| `SUPER + T` | Open Terminal (Foot) |
| `SUPER + Q` | Close Active Window |
| `SUPER + D` | App Launcher (Wofi) |
| `SUPER + B` | Web Browser (Brave) |
| `SUPER + E` | File Manager (Dolphin) |
| `SUPER + F` | Toggle Fullscreen |
| `SUPER + M` | Exit Hyprland Session |
| `SUPER + 1-9` | Switch Workspaces |
| `SUPER+SHIFT + 1-9` | Move Window to Workspace |

---

### 📂 Dosya Yapısı / File Structure

* `~/.config/hypr/hyprland-basic.conf`: Yeni sade konfigürasyon.
* `/usr/share/wayland-sessions/hyprland-basic.desktop`: Giriş ekranı (DM) entegrasyonu.
