#!/usr/bin/env bash
# DevPipe Cursor 安装脚本：将 skills（OpenSkills）和 agents（.cursor/agents）安装到目标项目。
# 用法：
#   从 GitHub 安装（在要使用 DevPipe 的项目根目录执行，请替换 REPO_URL）：
#     REPO_URL=https://github.com/doublekeric/dev-pipe.git curl -sL https://raw.githubusercontent.com/doublekeric/dev-pipe/main/scripts/install-cursor.sh | bash
#   从本地克隆安装：
#     cd /path/to/ai-game-pipeline && ./scripts/install-cursor.sh /path/to/your-project
#     # 或安装到当前目录：./scripts/install-cursor.sh

set -e

# 目标项目目录（要写入 .cursor/agents 和安装 skills 的目录）
TARGET_DIR="${1:-.}"
REPO_URL="${REPO_URL:-https://github.com/doublekeric/dev-pipe.git}"
TEMP_REPO=""

# 解析脚本所在目录（若从 curl 执行，SCRIPT_DIR 可能为空或非仓库）
if [[ -n "${BASH_SOURCE[0]}" && -f "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
else
  REPO_ROOT=""
fi

# 检查是否在仓库内（存在 agents/ 和 skills/）
is_inside_repo() {
  [[ -n "$REPO_ROOT" && -d "$REPO_ROOT/agents" && -d "$REPO_ROOT/skills" ]]
}

# 从临时克隆安装
install_from_clone() {
  TEMP_REPO="$(mktemp -d)"
  git clone --depth 1 "$REPO_URL" "$TEMP_REPO"
  REPO_ROOT="$TEMP_REPO"
}

# 安装 agents 到 .cursor/agents
install_agents() {
  local src="$1"
  local dest="$2"
  mkdir -p "$dest/.cursor/agents"
  if [[ -d "$src/agents" ]]; then
    cp -r "$src/agents/"*.md "$dest/.cursor/agents/" 2>/dev/null || true
    echo "  - .cursor/agents/ 已写入 $(ls "$dest/.cursor/agents" 2>/dev/null | wc -l) 个 agent 文件"
  fi
}

# 使用 OpenSkills 安装 skills（用项目内相对路径，避免 Windows 下 C:/ 被误当 GitHub 地址）
install_skills() {
  local src="$1"
  local dest="$2"
  local skills_tmp="$dest/.dev-pipe-install/skills"
  if [[ ! -d "$src/skills" ]]; then
    echo "  - 未找到 skills 目录，跳过"
    return
  fi
  mkdir -p "$skills_tmp"
  cp -r "$src/skills/"* "$skills_tmp/" 2>/dev/null || true
  (cd "$dest" && npx --yes openskills install "./.dev-pipe-install/skills")
  rm -rf "$dest/.dev-pipe-install"
  (cd "$dest" && npx --yes openskills sync 2>/dev/null) || true
  echo "  - skills 已通过 OpenSkills 安装到 $dest/.claude/skills/"
}

# 复制 templates 到 .claude/templates
install_templates() {
  local src="$1"
  local dest="$2"
  if [[ ! -d "$src/templates" ]]; then
    echo "  - 未找到 templates 目录，跳过"
    return
  fi
  mkdir -p "$dest/.claude/templates"
  cp -r "$src/templates/"* "$dest/.claude/templates/" 2>/dev/null || true
  local count=$(find "$dest/.claude/templates" -type f 2>/dev/null | wc -l)
  echo "  - templates 已复制到 $dest/.claude/templates/ ($count 个文件)"
}

# 主流程
main() {
  TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
  echo "DevPipe Cursor 安装 → 目标目录: $TARGET_DIR"

  if is_inside_repo; then
    echo "从当前仓库安装..."
    install_agents "$REPO_ROOT" "$TARGET_DIR"
    install_skills "$REPO_ROOT" "$TARGET_DIR"
    install_templates "$REPO_ROOT" "$TARGET_DIR"
  else
    echo "从 GitHub 克隆并安装: $REPO_URL"
    install_from_clone
    install_agents "$REPO_ROOT" "$TARGET_DIR"
    install_skills "$REPO_ROOT" "$TARGET_DIR"
    install_templates "$REPO_ROOT" "$TARGET_DIR"
    rm -rf "$TEMP_REPO"
  fi

  echo "Done. 使用方式：在 Cursor 中直接说「用 dev-pipe 实现 xxx」或「希望修改 xxx」（同一对话内无需重复说「用 dev-pipe」）。"
}

main
