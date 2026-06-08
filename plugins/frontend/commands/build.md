# TypeCheck + 프로덕션 빌드

## 1단계: 타입 검사

```bash
pnpm typecheck
```
실패 시 `frontend-conventions` 기준으로 타입 오류를 수정합니다.

## 2단계: 프로덕션 빌드

```bash
pnpm build
```

## 3단계: 결과 보고

빌드 성공/실패 여부와 번들 크기를 보고합니다.
