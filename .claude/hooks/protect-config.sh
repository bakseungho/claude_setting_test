#!/bin/bash

# stdin에서 JSON을 읽습니다
input=$(cat)

# jq로 파일 경로를 추출합니다
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')

# config 디렉토리 파일의 수정을 차단합니다
if [[ "$file_path" == */config/* ]]; then
  echo "config 디렉토리 파일은 직접 수정이 금지됩니다" >&2
  exit 2
fi

# 그 외 파일은 허용합니다
exit 0