#!/bin/bash

# 🌍 Digital Ecosystem - Quick Start Script
# Créé par Claude (Anthropic) - 24 juillet 2025

echo "🌍 Digital Ecosystem - Quick Start"
echo "=================================="
echo ""

# Vérifie si on est dans un repo git
if [ ! -d ".git" ]; then
    echo "❌ Erreur: Ce script doit être exécuté dans la racine du repository"
    exit 1
fi

# Vérifie si GitHub CLI est installé
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI (gh) n'est pas installé"
    echo "   Installez-le: https://cli.github.com/"
    echo "   Ou lancez manuellement via l'interface GitHub"
    echo ""
fi

echo "🚀 Options de lancement:"
echo ""
echo "1) Démarrer l'écosystème (premier cycle de vie)"
echo "2) Déclencher un événement spécial"
echo "3) Générer le dashboard"
echo "4) Voir le statut du repository"
echo "5) Ouvrir le dashboard local"
echo ""

read -p "Choisissez une option (1-5): " choice

case $choice in
    1)
        echo "🌱 Démarrage de l'écosystème..."
        if command -v gh &> /dev/null; then
            gh workflow run digital-ecosystem.yml
            echo "✅ Écosystème démarré ! Vérifiez l'onglet Actions de GitHub"
        else
            echo "🌐 Allez sur GitHub → Actions → Digital Ecosystem → Run workflow"
        fi
        ;;
    2)
        echo "🎭 Événements disponibles:"
        echo "   1) Golden Age (âge d'or)"
        echo "   2) Digital Eclipse (éclipse mystique)" 
        echo "   3) Natural Disaster (tempête digitale)"
        echo "   4) Migration Season (saison de migration)"
        echo "   5) Mating Season (saison des amours)"
        echo ""
        read -p "Choisissez un événement (1-5): " event_choice
        
        events=("golden_age" "digital_eclipse" "natural_disaster" "migration_season" "mating_season")
        if [ "$event_choice" -ge 1 ] && [ "$event_choice" -le 5 ]; then
            event_type=${events[$((event_choice-1))]}
            if command -v gh &> /dev/null; then
                gh workflow run creature-events.yml -f event_type=$event_type
                echo "✨ Événement '$event_type' déclenché!"
            else
                echo "🌐 Allez sur GitHub → Actions → Creature Events → Run workflow"
                echo "   Sélectionnez: $event_type"
            fi
        fi
        ;;
    3)
        echo "📊 Génération du dashboard..."
        if command -v gh &> /dev/null; then
            gh workflow run ecosystem-dashboard.yml
            echo "✅ Dashboard en cours de génération..."
        else
            echo "🌐 Allez sur GitHub → Actions → Ecosystem Dashboard → Run workflow"
        fi
        ;;
    4)
        echo "📈 Statut du repository:"
        echo ""
        echo "📂 Fichiers de l'écosystème:"
        if [ -d ".ecosystem" ]; then
            ls -la .ecosystem/ 2>/dev/null || echo "   Pas encore de données d'écosystème"
        else
            echo "   Pas encore initialisé - lancez l'option 1"
        fi
        echo ""
        echo "📊 Commits récents:"
        git log --oneline -5 2>/dev/null || echo "   Pas d'historique git"
        echo ""
        echo "🐛 Issues ouvertes:"
        if command -v gh &> /dev/null; then
            gh issue list --limit 5 2>/dev/null || echo "   Impossible de récupérer les issues"
        else
            echo "   Installez GitHub CLI pour voir les issues"
        fi
        ;;
    5)
        echo "🌐 Lancement du serveur web local..."
        if [ -f ".ecosystem/dashboard/index.html" ]; then
            echo "✅ Dashboard trouvé! Lancement du serveur..."
            echo "🔗 Ouvrez: http://localhost:8000/.ecosystem/dashboard/"
            echo "⏹️  Appuyez sur Ctrl+C pour arrêter"
            python3 -m http.server 8000
        else
            echo "❌ Dashboard pas encore généré"
            echo "   Lancez d'abord l'option 3 pour générer le dashboard"
        fi
        ;;
    *)
        echo "❌ Option invalide"
        ;;
esac

echo ""
echo "🌟 Digital Ecosystem créé avec ❤️ par Claude"
echo "📖 Consultez README.md pour plus d'informations"
