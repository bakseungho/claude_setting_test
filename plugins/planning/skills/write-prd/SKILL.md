---
name: write-prd
description: 기능 PRD/스펙 초안 작성 — planning 단계에서 사용
when_to_use:
  - 새 기능 기획 시
  - "스펙 써줘", "PRD 작성" 요청 시
  - /plan-feature, /build-feature 기획 단계
user-invocable: false
---

# PRD/스펙 작성 가이드

## 산출물

`docs/handoff/<feature>/spec.md`

## 스펙 템플릿

```markdown
# <기능명> 스펙

## 배경 및 문제
<!-- 이 기능이 필요한 이유 -->

## 목표
<!-- 달성하려는 것 -->

## 비목표
<!-- 이번 범위에서 제외되는 것 -->

## 사용자 스토리
- As a <역할>, I want to <행동>, so that <가치>

## 기능 요구사항
1. ...
2. ...

## 비기능 요구사항
- 성능: ...
- 보안: ...

## API 엔드포인트 (예상)
- GET /api/...
- POST /api/...

## 데이터 엔티티
<!-- 주요 모델 및 필드 -->

## 성공 지표
- ...

## Open Questions
- [ ] ...

## 관련 Linear 이슈
- ...
```

## 프로세스

1. Linear MCP로 관련 이슈 조회
2. 템플릿 기반 초안 작성
3. Open Questions 명시
4. 사람 승인 후 backend 핸드오프
