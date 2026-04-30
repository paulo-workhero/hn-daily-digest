#!/bin/bash
# deploy.sh — Copia o gallery mais recente e faz push pro GitHub Pages
# Uso: ./deploy.sh /caminho/para/hn-gallery-YYYY-MM-DD.html

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HTML_FILE="${1:-}"

if [ -z "$HTML_FILE" ]; then
    echo "Uso: ./deploy.sh /caminho/para/hn-gallery-YYYY-MM-DD.html"
    exit 1
fi

if [ ! -f "$HTML_FILE" ]; then
    echo "Erro: Arquivo não encontrado: $HTML_FILE"
    exit 1
fi

cp "$HTML_FILE" "$SCRIPT_DIR/index.html"

cd "$SCRIPT_DIR"
git add index.html
git commit -m "📰 Atualiza digest — $(date +%Y-%m-%d)"
git push origin main

echo "✅ Deploy feito! Acesse: https://paulo-workhero.github.io/hn-daily-digest/"
