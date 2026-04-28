#!/usr/bin/env bash
set -euo pipefail

# One-time project initialization script.
# Renames package based on current directory name, then deletes itself.

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DIR_NAME="$(basename "$PROJECT_DIR")"

# Derive names
DIST_NAME="$DIR_NAME"                              # e.g. my-awesome-project
PKG_NAME="${DIR_NAME//-/_}"                         # e.g. my_awesome_project

OLD_DIST="python-template"
OLD_PKG="python_template"

if [ "$PKG_NAME" = "$OLD_PKG" ]; then
    echo "Directory name is already '$DIR_NAME', nothing to rename."
    exit 0
fi

echo "Initializing project: $DIST_NAME (package: $PKG_NAME)"

# Rename package directory
mv "$PROJECT_DIR/src/$OLD_PKG" "$PROJECT_DIR/src/$PKG_NAME"

# Replace in file contents
if [[ "$(uname)" == "Darwin" ]]; then
    SED_CMD=(sed -i '')
else
    SED_CMD=(sed -i)
fi

FILES=(
    "$PROJECT_DIR/pyproject.toml"
    "$PROJECT_DIR/README.md"
    "$PROJECT_DIR/tests/test_main.py"
    "$PROJECT_DIR/.kiro/steering/structure.md"
    "$PROJECT_DIR/.kiro/steering/tech.md"
)

for f in "${FILES[@]}"; do
    [ -f "$f" ] || continue
    "${SED_CMD[@]}" "s|$OLD_DIST|$DIST_NAME|g" "$f"
    "${SED_CMD[@]}" "s|$OLD_PKG|$PKG_NAME|g" "$f"
done

echo "Done. You can now run: uv sync --group dev"
