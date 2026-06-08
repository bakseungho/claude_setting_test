# Lint 검사 및 자동 수정

대상: ${ARGUMENTS:-.}

## 1단계: Lint 실행

```bash
pnpm biome lint ${ARGUMENTS:-.}
```

## 2단계: 자동 수정 적용

```bash
pnpm biome lint --write ${ARGUMENTS:-.}
```

## 3단계: 잔여 이슈 수동 수정

`frontend-conventions` 스킬 기준으로 남은 위반 사항을 수동으로 수정합니다.

## 4단계: 결과 보고

미해결 이슈가 있으면 목록을 보고합니다.
