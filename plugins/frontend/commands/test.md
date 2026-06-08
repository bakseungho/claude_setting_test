# 프론트엔드 테스트 실행

대상: ${ARGUMENTS:-.}

## 1단계: 단위 테스트 (Vitest)

```bash
pnpm test ${ARGUMENTS:-.}
```

## 2단계: E2E 테스트 (Playwright)

핵심 시나리오(golden path) 실행:

```bash
pnpm e2e ${ARGUMENTS:-.}
```

## 3단계: 결과 보고

실패한 테스트가 있으면 파일명과 오류 메시지를 보고합니다.
`debugger` 에이전트가 필요한 경우 위임합니다.
