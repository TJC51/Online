#!/bin/bash
# compile-check.sh — 编译检查 Java 文件
# 被 hooks.json 的 PostToolUse 事件调用

set -e

# 查找被修改的 .java 文件
MODIFIED_FILE="${CLAUDE_TOOL_INPUT_FILE_PATH}"

if [ -z "$MODIFIED_FILE" ]; then
    exit 0
fi

if [[ "$MODIFIED_FILE" == *.java ]]; then
    echo "[Hook] 编译检查: $MODIFIED_FILE"
    if javac -encoding UTF-8 "$MODIFIED_FILE" 2>&1; then
        echo "[Hook] ✓ 编译通过"
    else
        echo "[Hook] ✗ 编译失败，请检查错误信息"
    fi
fi

exit 0
