#!/bin/bash
set -e

echo ">> Actualizando el sistema..."
sudo pacman -Syu --noconfirm

echo ">> Instalando paquetes base..."
sudo pacman -S --noconfirm git stow base-devel

echo ">> Instalando yay si no está presente..."
if ! command -v yay &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

echo ">> Instalando paquetes requeridos desde pacman..."
sudo pacman -S --noconfirm \
  alacritty rofi nautilus waybar mako swww \
  cliphist pamixer dunst brightnessctl playerctl \
  grim slurp swappy xdg-user-dirs \
  polkit-kde-agent-1 nm-connection-editor qt6ct

echo ">> Instalando paquetes desde AUR con yay..."
yay -S --noconfirm ttf-font-awesome

echo ">> Clonando dotfiles..."
cd ~
git clone https://github.com/tu-usuario/dotfiles.git
cd dotfiles/setup

echo ">> Ejecutando script de restauración de dotfiles..."
chmod +x restore.sh
./restore.sh

echo ">> Asignando permisos de ejecución al powermenu de Rofi (si aplica)..."
chmod +x ~/.config/hypr/rofi-powermenu.sh 2>/dev/null || true

echo ">> Instalación completada. Reinicia tu sesión para aplicar los cambios."
