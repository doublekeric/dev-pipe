#!/usr/bin/env bash
# Cantrip 安装：从 git 克隆或当前目录，把 agents/skills/templates 复制到目标项目的 .cursor。
# 用法：
#   在要使用 Cantrip 的项目根目录执行（从 GitHub 克隆并安装）：
#     bash -c "$(curl -sL https://raw.githubusercontent.com/doublekeric/dev-cantrip/main/scripts/install-cursor.sh)"
#   或从本地仓库安装到当前目录：  ./scripts/install-cursor.sh
#   或安装到指定目录：            ./scripts/install-cursor.sh /path/to/project

set -e

DEST="${1:-.}"
DEST="$(cd "$DEST" && pwd)"
REPO_URL="${REPO_URL:-https://github.com/doublekeric/dev-cantrip.git}"

# 确定来源：当前脚本所在仓库，或临时克隆
if [[ -f "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  SRC="$(cd "$SCRIPT_DIR/.." && pwd)"
fi
if [[ -z "$SRC" || ! -d "$SRC/agents" || ! -d "$SRC/skills" ]]; then
  SRC="$(mktemp -d)"
  trap "rm -rf '$SRC'" EXIT
  git clone --depth 1 "$REPO_URL" "$SRC"
fi

mkdir -p "$DEST/.cursor/agents" "$DEST/.cursor/skills" "$DEST/.cursor/templates"
cp -r "$SRC/agents/"* "$DEST/.cursor/agents/" 2>/dev/null || true
cp -r "$SRC/skills/"* "$DEST/.cursor/skills/" 2>/dev/null || true
cp -r "$SRC/templates/"* "$DEST/.cursor/templates/" 2>/dev/null || true

echo "Cantrip 已安装到 $DEST/.cursor/。使用：用 cantrip 实现 xxx（或 用 phase-router 实现 xxx）"
