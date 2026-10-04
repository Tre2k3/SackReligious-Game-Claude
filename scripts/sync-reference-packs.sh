#!/usr/bin/env bash
set -euo pipefail

SOURCE_REPO="Tre2k3/SackReligious-Game"
DEST_DIR="reference-packs"

command -v gh >/dev/null 2>&1 || { echo "GitHub CLI (gh) is required."; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Authenticate gh with access to both private repositories."; exit 1; }

mkdir -p "$DEST_DIR"

files=(
"SackReligious_Activity_Locations_Production_Pack_v1.zip"
"SackReligious_Character_Bible_AI_Reference_Pack.zip"
"SackReligious_Console_Quality_Game_Concepts.zip"
"SackReligious_Gameplay_Props_Items_Production_Pack_v1.zip"
"SackReligious_HQ_Production_Reference_Pack_v1.zip"
"SackReligious_UI_HUD_Production_Pack_v1.zip"
"SackReligious_Vehicle_Street_Systems_Production_Pack_v1.zip"
"SackReligious_World_Buildings_Reference_Pack_v1.zip"
)

for file in "${files[@]}"; do
  echo "Copying $file"
  gh api -H "Accept: application/vnd.github.raw+json"     "/repos/$SOURCE_REPO/contents/reference-packs/$file?ref=main"     > "$DEST_DIR/$file"
done

for f in "$DEST_DIR"/*.zip; do
  unzip -t "$f" >/dev/null
done

echo "All eight reference packs copied and verified."
