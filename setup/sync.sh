#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

# Usa 'main' o cambia si tu rama es 'master' u otra
BRANCH="main"

# Verifica si es un repo git
if [ ! -d .git ]; then
  echo "❌ No es un repositorio Git válido."
  exit 1
fi

# Añadir cambios
git add .

# Verifica si hay algo para commitear
if git diff --cached --quiet; then
  echo "No hay cambios para sincronizar."
  exit 0
fi

# Mensaje automático con fecha
MSG="Sync dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"

# Permitir mensaje personalizado: ./sync.sh "mensaje"
if [ -n "$1" ]; then
  MSG="$1"
fi

git commit -m "$MSG"
git push origin "$BRANCH"

echo "🚀 Dotfiles sincronizados con GitHub en rama '$BRANCH'."

