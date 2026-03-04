# Landing Page - Fernando Alvarez

Landing page personal creada con Flutter Web para mostrar servicios de desarrollo y soporte técnico.

## 🚀 Servicios incluidos

- **Desarrollo Web** - Sitios modernos y responsivos
- **Apps Móviles** - iOS y Android con Flutter
- **Invitaciones Digitales** - Bodas, XV años, eventos
- **Plantillas Web** - Templates personalizables
- **Soporte Técnico** - Windows, Office, configuración
- **Escritorio Remoto** - RDP, VPN, trabajo remoto
- **Diseño & Branding** - Logos e identidad visual
- **Capacitación** - Tutorías en tecnología

## 🛠️ Desarrollo

### Requisitos
- Flutter SDK 3.7+
- Chrome (para desarrollo web)

### Ejecutar localmente
```bash
flutter pub get
flutter run -d chrome
```

### Compilar para producción
```bash
flutter build web --release --base-href "/NOMBRE_REPO/"
```

## 📦 Desplegar en GitHub Pages

### Opción 1: Manual
1. Compila el proyecto:
   ```bash
   flutter build web --release --base-href "/landing_page_fa/"
   ```

2. Crea un repositorio en GitHub

3. Sube la carpeta `build/web`:
   ```bash
   cd build/web
   git init
   git checkout -b gh-pages
   git add .
   git commit -m "Deploy"
   git remote add origin https://github.com/TU_USUARIO/landing_page_fa.git
   git push -u origin gh-pages --force
   ```

4. En GitHub, ve a Settings > Pages > Source: `gh-pages` branch

### Opción 2: GitHub Actions (automático)
Crea `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
          
      - run: flutter pub get
      - run: flutter build web --release --base-href "/landing_page_fa/"
      
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

## ✏️ Personalización

### Cambiar información de contacto
Edita los archivos en `lib/widgets/`:
- `hero_section.dart` - WhatsApp
- `contact_section.dart` - Email, WhatsApp, Telegram
- `footer_section.dart` - Redes sociales

### Cambiar servicios
Edita `lib/widgets/services_section.dart`

### Cambiar colores
Edita `lib/main.dart` en el ThemeData

## 📄 Licencia
MIT License - Úsalo como quieras!

---
Hecho con ❤️ en Honduras 🇭🇳
