#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../LeanProof"
echo "[build] Running lake build"
lake build
