---
name: tokens-to-code
description: Figma 디자인 토큰(색상, 타이포그래피, 간격, 테두리, 그림자)을 코드 아티팩트로 변환
when_to_use:
  - "token sync", "Figma 토큰 가져오기" 요청 시
  - /build-feature 디자인 단계
  - 디자인 시스템 업데이트 시
user-invocable: false
---

# 디자인 토큰→코드 변환

## 산출물

1. `src/styles/tokens.ts` — `as const` 패턴의 타입드 토큰
2. `tailwind.config.ts` — 토큰 기반 Tailwind 테마 매핑
3. `docs/handoff/<feature>/design-notes.md` — 토큰 변경 기록

## 프로세스

1. Figma MCP로 토큰·스타일 데이터 조회
2. 색상, 간격, radius, 그림자, 타이포그래피 토큰 구조화
3. Tailwind theme에 토큰 매핑 (개발자가 raw 값 대신 토큰 참조)
4. design-notes.md에 변경 내역 기록
5. **글로벌 토큰 변경 시 사람 승인 필수**

## 토큰 구조 예시

```typescript
export const tokens = {
  colors: {
    primary: { 50: '#...', 500: '#...', 900: '#...' },
    semantic: { error: '#...', success: '#...' }
  },
  spacing: { xs: '4px', sm: '8px', md: '16px', lg: '24px' },
  radius: { sm: '4px', md: '8px', full: '9999px' },
  typography: {
    heading: { size: '24px', weight: 700 },
    body: { size: '16px', weight: 400 }
  }
} as const
```
