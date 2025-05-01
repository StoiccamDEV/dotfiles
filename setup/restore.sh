#!/usr/bin/env bash

set -e

REPO="https://github.com/StoiccamDEV/dotfiles.git"
DEST="$HOME/dotfiles"

echo "📦 Clonando repositorio de dotfiles..."
git clone "$REPO" "$DEST"

cd "$DEST"

echo "🔗 Creando symlinks con Stow..."
stow alacritty hypr mako nvim rofi waybar scripts

echo "✅ Dotfiles restaurados correctamente."

read -rp "¿Deseas instalar dependencias comunes? (y/n): " install_deps
if [[ "$install_deps" =~ ^[Yy]$ ]]; then
  echo "📦 Instalando dependencias..."
  sudo pacman -S --needed alacritty neovim rofi waybar hyprland mako git stow
  echo "✅ Dependencias instaladas."
fi

