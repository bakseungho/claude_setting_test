# frontend 플러그인

FE 역할 하네스입니다. FSD 아키텍처 기반 컴포넌트 구현을 담당합니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `frontend` | FSD 슬라이스/컴포넌트 구현 서브에이전트 (worktree 격리) |
| Command | `/scaffold-component <name>` | FSD 컴포넌트 + Vitest 테스트 stub 생성 |
| Command | `/lint [path]` | Biome lint 검사 및 자동 수정 |
| Command | `/build` | TypeCheck + 프로덕션 빌드 |
| Command | `/test [path]` | Vitest 단위 + Playwright E2E 테스트 |
| Skill | `frontend-conventions` | FSD 레이어 경계, 네이밍, 스타일, 자동화 가이드 |
| MCP | `figma` | Figma 디자인 토큰 연동 (OAuth) |
| MCP | `puppeteer` | localhost:3000 브라우저 검증 |

## 멀티 에이전트 흐름

```
backend + design 완료 후 시작
    ↓
frontend 에이전트 (구현)
    ↓
/lint → /build → /test
    ↓
qa 에이전트 (검증 루프, 최대 3회)
    ↓
승인 게이트 → merge
```

## MCP 인증

Figma MCP는 OAuth 인증이 필요합니다. 토큰은 개인 `~/.claude.json`에 저장됩니다.
