#!/bin/bash

# Lista de pacotes a verificar
PACOTES=(
    "base-devel"
    "meson"
    "ninja"
    "git"
    "gobject-introspection"
    "intltool"
    "xtrans"
    "vala"
    "network-manager-applet"
    "xdotool"    
)

FALTANDO=()

for pkg in "${PACOTES[@]}"; do
    if ! pacman -Qq "$pkg" &> /dev/null; then
        FALTANDO+=("$pkg")
    fi
done

if [ ${#FALTANDO[@]} -eq 0 ]; then
    echo "Todos os pacotes necessários estão instalados."
    exit 0
else
    PKGS_STR=$(printf "%s " "${FALTANDO[@]}")
    echo "Os seguintes pacotes estão faltando: $PKGS_STR"
    read -p "Deseja instalar? [s/N] " CONFIRMA
    if [[ "$CONFIRMA" =~ ^[sS]$ ]]; then
        sudo pacman -S --needed ${FALTANDO[@]}
    else
        echo "Instalação abortada."
        exit 1
    fi
fi