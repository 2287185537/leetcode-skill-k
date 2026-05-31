#!/usr/bin/env bash
# LeetCode 刷题 skill 安装脚本
# 把 lc-go / lc-done / lc-review 装进 Claude Code 的 skills 目录，并初始化数据目录。
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Claude Code 全局 skills 目录
SKILLS_DIR="$HOME/.claude/skills"

# 数据目录：优先用环境变量 LC_DATA_DIR，否则默认 ~/leetcode
DATA_DIR="${LC_DATA_DIR:-$HOME/leetcode}"

echo "==> 安装 skills 到 $SKILLS_DIR"
mkdir -p "$SKILLS_DIR"
for s in lc-go lc-done lc-review; do
  cp -R "$REPO_DIR/skills/$s" "$SKILLS_DIR/"
  echo "    ✓ $s"
done

echo "==> 初始化数据目录 $DATA_DIR"
mkdir -p "$DATA_DIR/题解"
for f in _题单.md _复习表.md; do
  if [ -e "$DATA_DIR/$f" ]; then
    echo "    • $f 已存在，跳过（不覆盖你的进度）"
  else
    cp "$REPO_DIR/templates/$f" "$DATA_DIR/$f"
    echo "    ✓ $f"
  fi
done

echo
echo "✅ 安装完成。"
if [ "${LC_DATA_DIR:-}" = "" ]; then
  echo "提示：数据目录用了默认值 $DATA_DIR。"
  echo "若想把刷题笔记放进你的 Obsidian 仓库，在 ~/.zshrc（或 ~/.bashrc）加一行："
  echo '    export LC_DATA_DIR="/path/to/your/vault/leetcode"'
  echo "然后重新运行本脚本初始化那个目录。"
fi
echo "在 Claude Code 里敲 /lc-go 开始刷题。"
