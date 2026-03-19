#!/bin/bash
# ============================================================
#  EduAdmin — Setup initial (à lancer UNE SEULE FOIS)
#  Prérequis : Node 18+, Java 17+, Android Studio (optionnel)
# ============================================================

set -e

echo ""
echo "🚀 EduAdmin — Setup Capacitor Android"
echo "======================================"
echo ""

# Vérifications
command -v node >/dev/null 2>&1 || { echo "❌ Node.js requis. https://nodejs.org"; exit 1; }
command -v java >/dev/null 2>&1 || { echo "❌ Java 17 requis. https://adoptium.net/"; exit 1; }

NODE_VER=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VER" -lt 18 ]; then
  echo "❌ Node.js 18+ requis (actuel: $(node -v))"; exit 1
fi

echo "✅ Node.js $(node -v)"
echo "✅ Java $(java -version 2>&1 | head -1)"
echo ""

# Installation des dépendances
echo "📦 Installation des dépendances npm..."
npm install

# Build React
echo ""
echo "🔨 Build React..."
npm run build

# Initialiser Capacitor (si pas encore fait)
if [ ! -f "capacitor.config.json" ]; then
  echo ""
  echo "⚙️  Initialisation de Capacitor..."
  npx cap init EduAdmin com.eduadmin.app --web-dir dist
fi

# Ajouter Android (si pas encore fait)
if [ ! -d "android" ]; then
  echo ""
  echo "📱 Ajout de la plateforme Android..."
  npx cap add android
fi

# Sync
echo ""
echo "🔄 Synchronisation Capacitor..."
npx cap sync android

# Personnalisation du nom de l'app
echo ""
echo "✏️  Configuration du nom de l'application..."

STRINGS_FILE="android/app/src/main/res/values/strings.xml"
if [ -f "$STRINGS_FILE" ]; then
  sed -i 's|<string name="app_name">.*</string>|<string name="app_name">EduAdmin</string>|g' "$STRINGS_FILE"
  echo "✅ Nom de l'app mis à jour"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Setup terminé !"
echo ""
echo "Prochaines étapes :"
echo ""
echo "1. Créez votre repo GitHub et poussez le code :"
echo "   git init && git add . && git commit -m 'Initial commit'"
echo "   git remote add origin https://github.com/VOTRE_USER/EduAdmin.git"
echo "   git push -u origin main"
echo ""
echo "2. Générez votre keystore (signature APK) :"
echo "   bash scripts/generate-keystore.sh"
echo ""
echo "3. Ajoutez les secrets dans GitHub → Settings → Secrets"
echo ""
echo "4. Créez un tag pour déclencher le build :"
echo "   git tag v1.0.0 && git push origin v1.0.0"
echo ""
echo "5. Récupérez l'APK dans :"
echo "   https://github.com/VOTRE_USER/EduAdmin/releases"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
