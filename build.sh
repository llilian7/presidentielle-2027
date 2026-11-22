#!/bin/bash
# Usage: build.sh <accueil.html> <out_dir>
set -e
SRC="$1"; OUT="$2"; mkdir -p "$OUT"
{
  echo '<!doctype html>'
  echo '<html lang="fr">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">'
  echo '<meta name="description" content="Les mêmes questions à chaque candidat à la présidentielle 2027 : réponses courtes, chiffres, mesures expliquées, sources et faisabilité.">'
  echo '<meta property="og:title" content="Comparateur Présidentielle 2027">'
  echo '<meta property="og:description" content="Les mêmes questions à chaque candidat : réponses, mesures, sources et faisabilité.">'
  echo '<meta property="og:type" content="website">'
  echo '<meta property="og:url" content="https://llilian7.github.io/presidentielle-2027/">'
  echo '<meta property="og:image" content="https://llilian7.github.io/presidentielle-2027/og.png">'
  echo '<meta property="og:image:width" content="1200">'
  echo '<meta property="og:image:height" content="630">'
  echo '<meta name="twitter:card" content="summary_large_image">'
  echo '<meta name="theme-color" content="#264a6e">'
  echo '<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 32 32%22%3E%3Crect width=%2232%22 height=%2232%22 rx=%227%22 fill=%22%23264a6e%22/%3E%3Ctext x=%2216%22 y=%2221%22 font-size=%2211%22 font-family=%22sans-serif%22 font-weight=%22700%22 fill=%22white%22 text-anchor=%22middle%22%3E2027%3C/text%3E%3C/svg%3E">'
  grep -v 'name="claude:viewport-fit-sides"' "$SRC" | sed -n '1,/<\/style>/p'
  echo '</head>'
  echo '<body>'
  sed -n '/<\/style>/,$p' "$SRC" | tail -n +2
  echo '</body>'
  echo '</html>'
} > "$OUT/index.html"
touch "$OUT/.nojekyll"
# Image d'aperçu pour les réseaux sociaux
if [ -f "$(dirname "$0")/og.png" ]; then cp "$(dirname "$0")/og.png" "$OUT/og.png"; fi

