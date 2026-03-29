#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

./scripts/build.sh

echo "[verify] Checking for forbidden placeholders"
if grep -RInE --include='*.lean' '\b(sorry|admit|axiom)\b' Problem.lean .; then
  echo "[verify] Forbidden placeholders found in Lean files" >&2
  exit 1
fi

echo "[verify] OK"
