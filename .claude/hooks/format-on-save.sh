#!/bin/bash

input=$(cat)
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')

# 파일 확장자에 따라 포매터를 선택합니다
case "$file_path" in
  *.py)
    black "$file_path" 2>&1
    ;;
  *.ts|*.js)
    npx prettier --write "$file_path" 2>&1
    ;;
  *.go)
    gofmt -w "$file_path" 2>&1
    ;;
esac

exit 0