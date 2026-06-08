# qa 플러그인

QA 역할 하네스입니다. 테스트 생성, 코드 리뷰, 디버깅을 담당합니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `code-reviewer` | git diff 기반 보안/품질/성능 자동 리뷰 (worktree 격리) |
| Agent | `debugger` | 에러 스택 추적 및 근본 원인 분석 (background) |
| Command | `/test_gen <file>` | 소스 분석 후 Jest 단위 테스트 자동 생성 |
| Command | `/test_review` | 변경 파일 코드 리뷰 → `REVIEW_결과.md` |
| Skill | `code-review` | 10년 경력 시니어 리뷰어 관점 코드 검토 |
| Hook | `protect-config.sh` | config 디렉토리 직접 수정 차단 (PreToolUse) |
| Hook | `format-on-save.sh` | 저장 시 자동 포맷 Prettier/black/gofmt (PostToolUse) |
| MCP | `puppeteer` | localhost:3000 브라우저 자동 검증 |

## 멀티 에이전트 흐름

```
코드 수정 완료
    ↓
code-reviewer (품질/보안 검토)
    ↓
테스트 실패 발생 시 → debugger (근본 원인 분석)
    ↓
수정 후 재검토
```

## 서브에이전트 규칙

- 코드 수정 후 → `code-reviewer` 에이전트 자동 실행
- 테스트 실패 시 → `debugger` 에이전트 먼저 분석 후 수정
