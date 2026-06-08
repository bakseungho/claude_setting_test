---
name: backend-conventions
description: Node.js/Express/TypeScript 백엔드 코딩 컨벤션 — 계층 구조, 에러 처리, Prisma 사용 규칙
when_to_use:
  - 새 라우터/컨트롤러/서비스 작성 시
  - Prisma 스키마 변경 시
  - 에러 처리 패턴 확인 시
user-invocable: false
---

# 백엔드 컨벤션

## 계층 구조

```
routes → controllers → services → models(Prisma)
```

- **routes**: URL 매핑만 담당. 비즈니스 로직 없음
- **controllers**: 요청 파싱, 응답 직렬화, services 호출
- **services**: 비즈니스 로직, Prisma client 직접 사용
- **models**: Prisma 스키마 타입 정의

## 에러 처리

```typescript
// 에러 응답은 사용자/개발자 메시지 분리
{
  message: "요청을 처리할 수 없습니다.",     // 사용자용
  error: "prisma: unique constraint failed"   // 개발자용 (dev 환경만)
}
```

- 모든 비동기 작업은 `try-catch`로 감싸기
- HTTP 상태 코드: 200/201/400/401/403/404/409/500

## Prisma 사용 규칙

- `prisma.$transaction()` — 복수 테이블 업데이트 시 필수
- `select` 명시 — 불필요한 컬럼 노출 방지
- DB 스키마 변경 시 사람 승인 게이트 필수

## TypeScript 규칙

- Request body/params는 `zod` 또는 명시적 타입으로 검증
- `any` 금지 — `unknown` 또는 명시적 타입
- 모든 public 함수에 JSDoc 필수
