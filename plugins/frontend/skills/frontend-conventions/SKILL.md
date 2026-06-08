---
name: frontend-conventions
description: FSD 아키텍처 기반 프론트엔드 코딩 컨벤션 — 레이어 경계, 네이밍, 스타일, 자동화
when_to_use:
  - FSD 슬라이스/컴포넌트 작성 시
  - Lint/타입 오류 수정 시
  - 코드 리뷰에서 FE 컨벤션 확인 시
user-invocable: false
---

# FE 코딩 컨벤션 (FSD)

## 핵심 원칙

1. FSD 레이어 경계 준수 — 위 레이어는 아래 레이어만 import
2. 각 슬라이스는 `index.ts` public API로만 노출
3. 타입 우선 (`any` 금지), 외부 경계는 zod 검증
4. Server Component 기본, 상호작용 부분만 `"use client"`
5. Biome(lint+format) + Steiger(경계 검사) 자동화
6. 하드코딩 금지, 디자인 토큰만 사용

## 레이어 구조

```
app/ → views/ → widgets/ → features/ → entities/ → shared/
```

## 슬라이스 내부 세그먼트

```
├── ui/       # 컴포넌트
├── model/    # 상태·로직
├── api/      # 요청·액션
├── lib/      # 유틸
├── config/   # 상수
└── index.ts  # public API
```

## 네이밍 규칙

| 대상 | 규칙 | 예시 |
|------|------|------|
| 폴더 | kebab-case | `user-profile/` |
| 컴포넌트 | PascalCase | `UserCard.tsx` |
| 훅 | `use*` prefix | `useUserData` |
| 상수 | UPPER_SNAKE_CASE | `MAX_ITEMS` |

## 컴포넌트 규칙

- `function` 선언, named export
- Props 타입 명시 (`interface ComponentProps`)
- Server Component 기본, 필요 시 `"use client"`

## 데이터 패턴

- Server Component: 직접 fetch
- 클라이언트 상태: TanStack Query
- 전역 상태: Zustand

## 스타일

- Tailwind + 디자인 토큰만 사용
- raw 값 (`#FF0000`, `16px`) 하드코딩 금지

## 자동화 검사

- **Biome**: lint + format
- **Steiger**: 레이어 경계 위반 검사
- **PR 게이트**: typecheck + test + build + E2E 필수

## 금지사항

- 레이어 경계 위반 (역방향 import)
- public API 우회 (`../../../` 상대경로 depth 3 이상)
- `any` 타입 사용
- 토큰 미사용 하드코딩
- 라우트 파일의 비즈니스 로직
