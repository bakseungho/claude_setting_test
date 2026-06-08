# planning 플러그인

기획 역할 하네스입니다. PRD/스펙 작성 및 Linear 이슈 연동을 담당합니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `planning` | PRD/스펙 작성 및 요구사항 정리 서브에이전트 |
| Command | `/plan-feature <feature>` | 기능 스펙 초안 작성 → `docs/handoff/<feature>/spec.md` |
| Skill | `write-prd` | PRD 템플릿 및 작성 프로세스 |
| MCP | `linear` | Linear 이슈 트래커 연동 (OAuth) |

## 워크플로우

```
/plan-feature <feature>
    ↓
Linear에서 관련 이슈 조회
    ↓
write-prd 스킬로 스펙 초안 작성
    ↓
승인 게이트 (사람 검토)
    ↓
docs/handoff/<feature>/spec.md → backend 핸드오프
```

## MCP 인증

Linear MCP는 OAuth 인증이 필요합니다. 토큰은 개인 `~/.claude.json`에 저장됩니다.
