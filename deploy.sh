#!/bin/bash

# Script para desplegar Flutter Web en GitHub Pages
# Uso: ./deploy.sh nombre-de-tu-repo

REPO_NAME=${1:-landing_page_fa}

echo "🚀 Compilando Flutter Web..."
flutter build web --release --base-href "/$REPO_NAME/"

echo "📁 Preparando archivos para GitHub Pages..."
cd build/web

# Inicializar git si no existe
if [ ! -d ".git" ]; then
  git init
  git checkout -b gh-pages
fi

# Agregar y commitear cambios
git add .
git commit -m "Deploy $(date '+%Y-%m-%d %H:%M:%S')"

echo "📤 Para subir a GitHub Pages, ejecuta:"
echo "cd build/web"
echo "git remote add origin https://github.com/TU_USUARIO/$REPO_NAME.git"
echo "git push -u origin gh-pages --force"

echo ""
echo "✅ ¡Build completado!"
echo "📍 Los archivos están en: build/web/"
