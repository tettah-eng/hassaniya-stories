#!/usr/bin/env bash
set -euo pipefail

INPUT="data/hassaniya_stories_collection.json"
mkdir -p results

# 1. Extraire les phrases (une par ligne)
grep '"sentence"' "$INPUT" | tr -d '\r' | sed 's/^ *"sentence": "//; s/"$//' > results/sentences.txt

# 2. Statistiques
echo "Nombre de phrases : $(wc -l < results/sentences.txt)"
echo "Nombre de mots    : $(wc -w < results/sentences.txt)"

# 3. Les 10 mots les plus frequents
tr -s ' ' '\n' < results/sentences.txt | sort | uniq -c | sort -nr | head -10 > results/top_words.txt
echo "Top 10 mots dans results/top_words.txt"
