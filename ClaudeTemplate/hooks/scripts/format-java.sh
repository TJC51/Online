#!/bin/bash
# format-java.sh — 提示 Java 代码格式规范
# 被 hooks.json 的 PostToolUse 事件调用

MODIFIED_FILE="${CLAUDE_TOOL_INPUT_FILE_PATH}"

if [ -z "$MODIFIED_FILE" ]; then
    exit 0
fi

if [[ "$MODIFIED_FILE" == *.java ]]; then
    echo "[Hook] 格式检查提示: 请确保遵循 Java 编码规范（4空格缩进、PascalCase 类名、camelCase 方法名）"
fi

exit 0
