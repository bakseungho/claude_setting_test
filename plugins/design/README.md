# design 플러그인

디자인 역할 하네스입니다. Figma MCP 중심으로 디자인 토큰을 코드로 변환합니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `design` | Figma 토큰 추출 및 코드 변환 서브에이전트 (worktree 격리) |
| Skill | `tokens-to-code` | Figma → `tokens.ts` + Tailwind 테마 변환 |
| Skill | `design-system-guide` | 컴포넌트 상태, 접근성, Figma↔코드 매핑 가이드 |
| MCP | `figma` | Figma 디자인 파일 연동 (OAuth) |

## 워크플로우

```
/build-feature 디자인 단계 (backend와 병렬 실행)
    ↓
Figma MCP로 토큰/스펙 조회
    ↓
tokens-to-code 스킬로 변환
    ↓
src/styles/tokens.ts + tailwind.config.ts
    ↓
docs/handoff/<feature>/design-notes.md
```

## 파일 소유권

- `src/styles/tokens.ts`, `docs/handoff/<feature>/design-notes.md`만 수정
- backend 영역 (api-contract.md, 서버 코드) 접근 금지

## MCP 인증

Figma MCP는 OAuth 인증이 필요합니다. 토큰은 개인 `~/.claude.json`에 저장됩니다.
