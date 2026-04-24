#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}Özelleştirilmiş Hyprland Kurulum Scripti v1.4${NC}"


if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    LIKE=$ID_LIKE
else
    echo -e "${RED}Hata: İşletim sistemi tespit edilemedi.${NC}"
    exit 1
fi

case "$OS" in
    "arch")
        PM="sudo pacman -S --needed --noconfirm"
        PKGS="hyprland waybar wofi mako hyprpaper foot xdg-desktop-portal-hyprland"
        HYPR_EXEC="hyprland"
        ;;
    "fedora")
        echo -e "${YELLOW}Fedora için COPR deposu etkinleştiriliyor...${NC}"
        sudo dnf install -y 'dnf-command(copr)'
        sudo dnf copr enable solopasha/hyprland -y
        
        PM="sudo dnf install -y"
        PKGS="hyprland waybar wofi foot mako swaybg xdg-desktop-portal-hyprland"
        HYPR_EXEC="Hyprland"
        ;;
    "debian"|"ubuntu")
        PM="sudo apt-get install -y"
        PKGS="hyprland waybar wofi foot mako xdg-desktop-portal-hyprland"
        HYPR_EXEC="hyprland"
        sudo apt-get update
        ;;
    *)
        if [[ "$LIKE" == *"arch"* ]]; then
            PM="sudo pacman -S --needed --noconfirm"
            PKGS="hyprland waybar wofi foot mako xdg-desktop-portal-hyprland"
            HYPR_EXEC="hyprland"
        else
            echo -e "${RED}Desteklenmeyen dağıtım: $OS${NC}"
            exit 1
        fi
        ;;
esac


echo -e "${GREEN}[1/4] Paketler kuruluyor...${NC}"
$PM $PKGS


mkdir -p "$HOME/.config/hypr"


echo -e "${GREEN}[2/4] Konfigürasyon dosyası oluşturuluyor...${NC}"

cat <<EOF > "$HOME/.config/hypr/hyprland-basic.conf"
monitor=,preferred,auto,1
input {
    kb_layout = tr
    numlock_by_default = true
}
exec-once = waybar
exec-once = mako
exec-once = swaybg -m fill -c "#222222"

general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(ffffffaa)
    col.inactive_border = rgba(595959aa)
}

$mainMod = SUPER
bind = $mainMod, T, exec, foot
bind = $mainMod, Q, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, D, exec, wofi --show drun
bind = $mainMod, E, exec, thunar

bind = $mainMod, 1, workspace, 1
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod, F, fullscreen,
bind = $mainMod SHIFT, right, movetoworkspace, e+1
bind = $mainMod SHIFT, left, movetoworkspace, e-1
bind = $mainMod, Space, togglefloating,
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
bind = $mainMod, left, movewindow, l
bind = $mainMod, right, movewindow, r
bind = $mainMod, up, movewindow, u
bind = $mainMod, down, movewindow, d
$(for i in {1..9}; do
    echo "bind = \$mainMod, $i, workspace, $i"
    echo "bind = \$mainMod SHIFT, $i, movetoworkspace, $i"
done)
EOF


echo -e "${GREEN}[3/4] Masaüstü oturum dosyası hazırlanıyor...${NC}"
sudo mkdir -p /usr/share/wayland-sessions

sudo tee /usr/share/wayland-sessions/hyprland-basic.desktop <<EOF > /dev/null
[Desktop Entry]
Name=Hyprland (Custom)
Comment=Hyprland oturumu (foot & wofi)
Exec=$HYPR_EXEC --config $HOME/.config/hypr/hyprland-basic.conf
Type=Application
DesktopNames=Hyprland
EOF

chmod +x "$HOME/.config/hypr/hyprland-basic.conf"

echo -e "${GREEN}[4/4] İşlem başarıyla tamamlandı!${NC}"
echo -e "${BLUE}Giriş ekranında 'Hyprland (Custom)' oturumunu seçerek başlayabilirsin.${NC}"
