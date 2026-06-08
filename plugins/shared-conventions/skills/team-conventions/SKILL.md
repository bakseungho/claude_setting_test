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

### 필수

- 모든 새 함수에 단위 테스트 작성
- 테스트 파일명: `{함수명}.test.ts`
- Given-When-Then 주석 패턴 사용
- 커버리지 80% 이상 유지

### 금지

- 실제 DB 연결 테스트 금지 (Mock 사용)
- `sleep` / `setTimeout` 사용 금지

## 브라우저 검증 규칙

Puppeteer MCP(`@modelcontextprotocol/server-puppeteer`)를 사용한다.

### 검증이 필요한 작업

- UI 컴포넌트 추가/수정
- API 엔드포인트 추가/수정
- 인증/권한 로직 변경
- 미들웨어 변경

### 검증 절차

1. `localhost:3000` 접속 후 페이지 로드 완료 확인
2. 콘솔 오류 없는지 확인 (빨간 에러 메시지)
3. 네트워크 API 호출 실패(4xx, 5xx) 없는지 확인
4. 변경된 컴포넌트가 의도대로 표시되는지 확인
5. 핵심 시나리오(golden path) 직접 실행

### 문제 발생 시

1. 스크린샷 캡처 — 오류 상태 기록
2. 콘솔 로그 수집 — 오류 메시지 전문 복사
3. 네트워크 탭 확인 — 실패 요청의 요청/응답 본문 확인
4. 원인 파악 후 수정 — 추측으로 코드 변경 금지
5. 수정 후 재검증 — 동일한 절차 반복

### 검증 완료 기준

- [ ] 콘솔에 에러 없음
- [ ] 변경된 기능이 정상 동작함
- [ ] 기존 기능에 회귀(regression) 없음

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
