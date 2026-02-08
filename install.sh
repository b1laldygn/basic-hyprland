#!/bin/bash

# Renkler
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Basic Hyprland Kurulumu Başlıyor...${NC}"

# 1. Gerekli Paketlerin Kurulumu (Arch Linux örneği - Dağıtımına göre değiştirilebilir)
echo -e "${GREEN}[1/4] Gerekli minimal paketler yükleniyor...${NC}"
sudo pacman -S --needed waybar wofi mako hyprpaper foot --noconfirm

# 2. Config Dizini Hazırlığı
mkdir -p ~/.config/hypr

# 3. hyprland-basic.conf Oluşturma
echo -e "${GREEN}[2/4] Basic konfigürasyon dosyası oluşturuluyor...${NC}"
cat <<EOF > ~/.config/hypr/hyprland-basic.conf
# BASIC HYPRLAND CONFIG
monitor=,preferred,auto,1

input {
    kb_layout = tr
    numlock_by_default = true
}
exec-once = waybar
exec-once = mako
exec-once = hyprpaper

general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(ffffffaa)
    col.inactive_border = rgba(595959aa)
}

decoration {
    rounding = 8
    drop_shadow = false
}

animations {
    enabled = yes
    animation = windows, 1, 4, default
    animation = workspaces, 1, 3, default
}

# Temel K  sayollar
$mainMod = SUPER
bind = $mainMod, T, exec, foot  # Terminal
bind = $mainMod, Q, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, dolphin
bind = $mainMod, D, exec, wofi --show drun
bind = $mainMod, B, exec, brave
bind = $mainMod, F, fullscreen, 1

# === Numbered Workspaces ===
bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, 6, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, 8, workspace, 8
bind = SUPER, 9, workspace, 9

# === Move to Numbered Workspaces ===
bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6
bind = SUPER SHIFT, 7, movetoworkspace, 7
bind = SUPER SHIFT, 8, movetoworkspace, 8
bind = SUPER SHIFT, 9, movetoworkspace, 9
EOF

# 4. Masaüstü Oturumu (Desktop Entry) Oluşturma
echo -e "${GREEN}[3/4] Giriş ekranı oturum dosyası oluşturuluyor...${NC}"
USER_NAME=$(whoami)
sudo bash -c "cat <<EOF > /usr/share/wayland-sessions/hyprland-basic.desktop
[Desktop Entry]
Name=Hyprland (Basic)
Comment=Sade ve Hafif Hyprland Oturumu
Exec=Hyprland --config /home/$USER_NAME/.config/hypr/hyprland-basic.conf
Type=Application
DesktopNames=Hyprland
EOF"

echo -e "${GREEN}[4/4] İzinler ayarlanıyor...${NC}"
chmod +x ~/.config/hypr/hyprland-basic.conf

echo -e "${BLUE}Kurulum Tamamlandı!${NC}"
echo -e "Lütfen oturumu kapatıp giriş ekranından ${GREEN}'Hyprland (Basic)'${NC} seçeneğini seçin."
