# Claude 개발 워크플로우 플러그인

Node.js/TypeScript API 프로젝트를 위한 Claude Code 마켓플레이스 플러그인 모음입니다.

## 플러그인 구성

| 플러그인 | 설명 |
|----------|------|
| `conventions` | 공통 코딩 규칙, 테스트 작성 규칙, 브라우저 검증 규칙 |
| `api-workflow` | 코드 리뷰, 테스트 생성, API 문서화, 릴리즈 파이프라인 |

## 설치 방법

### 마켓플레이스로 설치

```
/plugin marketplace add bakseungho/claude_setting_test
/plugin install conventions@claude-dev-workflow
/plugin install api-workflow@claude-dev-workflow
```

### 직접 복사 사용

```bash
git clone https://github.com/bakseungho/claude_setting_test
cp -r claude_setting_test/plugins/conventions/.claude-plugin your-project/.claude/
cp -r claude_setting_test/plugins/api-workflow/.claude-plugin your-project/.claude/
```

## 포함 기능

### conventions

- `team-conventions` 스킬 — 테스트 규칙, 브라우저 검증 절차, 코딩 컨벤션 통합

### api-workflow

| 종류 | 이름 | 설명 |
|------|------|------|
| Skill | `code-review` | 품질/보안/성능 관점 코드 리뷰 |
| Command | `/docs` | API 문서 자동 생성 → `docs/API.md` |
| Command | `/release <version>` | 검증→테스트→빌드→태깅 릴리즈 파이프라인 |
| Command | `/test_gen <file>` | Jest 단위 테스트 자동 생성 |
| Command | `/test_review` | 변경 파일 코드 리뷰 → `REVIEW_결과.md` |
| Agent | `code-reviewer` | git diff 기반 자동 리뷰 서브에이전트 |
| Agent | `debugger` | 에러 근본 원인 분석 서브에이전트 |
| Hook | `protect-config.sh` | config 디렉토리 직접 수정 차단 |
| Hook | `format-on-save.sh` | 저장 시 자동 포맷 |
| MCP | `puppeteer` | localhost:3000 브라우저 자동 검증 |
