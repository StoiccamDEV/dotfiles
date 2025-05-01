#!/bin/bash

# Rofi Power Menu Script

# Opciones del menú con iconos Nerd Font
OPTIONS="⏻ Apagar\n Reiniciar\n Suspender\n Bloquear\n Salir"
# Iconos: poweroff, restart, moon, lock, sign-out-alt

# Muestra Rofi
SELECTED="$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Sistema" -theme-str 'listview {lines: 5;} element-text { horizontal-align: 0.5; }' )" # Tema inline para centrar texto

# Ejecuta la acción seleccionada
case "$SELECTED" in
    "⏻ Apagar")
        systemctl poweroff
        ;;
    " Reiniciar")
        systemctl reboot
        ;;
    " Suspender")
        systemctl suspend
        ;;
    " Bloquear")
        # Añade aquí tu comando de bloqueo de pantalla preferido
        # Ejemplos: swaylock, hyprlock, etc.
        # hyprlock # (Descomenta y usa si instalas hyprlock)
        loginctl lock-session # Opción genérica de systemd
        ;;
    " Salir")
        hyprctl dispatch exit 0 # Sale de Hyprland
        ;;
esac

exit 0