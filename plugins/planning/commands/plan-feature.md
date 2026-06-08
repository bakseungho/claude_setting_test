# 기능 기획 및 스펙 작성

대상 기능: $ARGUMENTS

`write-prd` 스킬 기준으로 스펙 초안을 작성합니다.

## 1단계: Linear 이슈 조회

Linear MCP로 `$ARGUMENTS`와 관련된 이슈/프로젝트를 검색합니다.

## 2단계: 스펙 초안 작성

`docs/handoff/$ARGUMENTS/spec.md` 파일을 `write-prd` 스킬 템플릿으로 작성합니다.

## 3단계: 미해결 질문 정리

불명확한 요구사항은 Open Questions 섹션에 명시합니다.

## 4단계: 승인 게이트

스펙을 검토하고 승인을 요청합니다.
승인 완료 후 backend 단계로 핸드오프합니다.
