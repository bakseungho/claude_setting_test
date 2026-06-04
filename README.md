# Claude 개발 워크플로우 플러그인

Node.js/TypeScript API 프로젝트를 위한 Claude Code 설정 모음입니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Skill | `code-review` | 코드 품질/보안/성능 리뷰 |
| Command | `/docs` | API 문서 자동 생성 |
| Command | `/release <version>` | 릴리즈 파이프라인 (검증→테스트→빌드→태깅) |
| Command | `/test_gen <file>` | 단위 테스트 자동 생성 |
| Command | `/test_review` | 변경 파일 코드 리뷰 |
| Agent | `code-reviewer` | git diff 기반 자동 리뷰 서브에이전트 |
| Agent | `debugger` | 에러 근본 원인 분석 서브에이전트 |
| Hook | `protect-config.sh` | config 디렉토리 직접 수정 차단 |
| Hook | `format-on-save.sh` | 저장 시 자동 포맷 |
| MCP | `puppeteer` | 브라우저 자동화 (localhost:3000 검증) |

## 설치 방법

### 마켓플레이스 등록 후 설치

```
/plugin marketplace add bakseungho/claude_setting_test
/plugin install claude-dev-workflow@bakseungho
```

### 직접 복사 사용

이 저장소를 클론 후 `.claude/` 폴더와 `.mcp.json`을 프로젝트에 복사합니다.

```bash
git clone https://github.com/bakseungho/claude_setting_test
cp -r claude_setting_test/.claude your-project/
cp claude_setting_test/.mcp.json your-project/
```

## 사용 예시

```
/docs                    # API 문서 생성
/test_gen src/user.ts    # 테스트 코드 생성
/release 1.2.0           # 릴리즈
/test_review             # 코드 리뷰
```
