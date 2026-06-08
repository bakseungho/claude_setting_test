---
name: team-conventions
description: Node.js/TypeScript 프로젝트 공통 규칙 — 테스트 작성, 브라우저 검증, 코딩 컨벤션
when_to_use:
  - 새 함수나 모듈 작성 시 테스트 규칙 참조
  - UI/API 변경 후 브라우저 검증 절차 실행
  - 코드 스타일 및 네이밍 규칙 확인
user-invocable: false
---

# 팀 공통 컨벤션

이 문서는 프로젝트의 Single Source of Truth입니다. 모든 플러그인은 이 규칙을 전제로 동작합니다.

## 테스트 작성 규칙

@rules/testing.md

## 브라우저 검증 규칙

@rules/browser-verify.md

## 코딩 컨벤션

### 네이밍

| 대상 | 규칙 | 예시 |
|------|------|------|
| 파일 | kebab-case | `user-service.ts` |
| 클래스/인터페이스 | PascalCase | `UserService` |
| 함수/변수 | camelCase | `getUser` |
| 상수 | UPPER_SNAKE_CASE | `MAX_RETRY` |

### TypeScript

- `any` 금지 — `unknown` 또는 명시적 타입 사용
- 모든 public 함수에 JSDoc 필수
- 비동기는 반드시 `async/await` (Promise 체이닝 금지)

### 에러 처리

- 모든 비동기 작업은 `try-catch`로 감싸기
- 에러 응답은 사용자 메시지와 개발자 메시지를 분리하여 반환

## 공통 금지사항

- 비밀키 코드 하드코딩 (`.env`에만 저장)
- `any` 타입 남용
- 승인 없는 새 패키지 추가
- 테스트 없이 PR 승인
