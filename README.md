# Claude 개발 워크플로우 플러그인

역할별(기획/BE/FE/Design/QA) 엔지니어링 하네스 플러그인 모음입니다. 공통 규칙은 `shared-conventions`, 전체 워크플로우는 `orchestrator`로 엮습니다.

## 플러그인 구성

| 플러그인 | 버전 | 설명 |
|----------|------|------|
| `shared-conventions` | 1.1.0 | 공통 코딩 규칙, 테스트/브라우저 검증 규칙, `/commit` 자동화 |
| `planning` | 1.0.0 | PRD/스펙 작성, `/plan-feature`, Linear MCP |
| `backend` | 1.0.0 | Express API 설계·스캐폴딩, 멀티 에이전트 |
| `frontend` | 1.0.0 | FSD 컴포넌트 스캐폴딩, Figma MCP |
| `design` | 1.0.0 | 디자인 토큰→코드 변환, Figma MCP |
| `qa` | 1.0.0 | 코드 리뷰·테스트 생성, 멀티 에이전트, Puppeteer MCP |
| `orchestrator` | 1.0.0 | `/build-feature` 전체 워크플로우 진입점, `/release` 배포 |

## 빠른 시작

### 1. 마켓플레이스 등록

```
/plugin marketplace add bakseungho/claude_setting_test
```

### 2. 플러그인 설치

```
/plugin install shared-conventions@claude-dev-workflow
/plugin install planning@claude-dev-workflow
/plugin install backend@claude-dev-workflow
/plugin install frontend@claude-dev-workflow
/plugin install design@claude-dev-workflow
/plugin install qa@claude-dev-workflow
/plugin install orchestrator@claude-dev-workflow
```

또는 `settings.json`을 복사하면 Claude가 자동으로 설치해줍니다:

```bash
cp .claude/settings.json your-project/.claude/settings.json
# Claude 대화창에서: "플러그인 설치해줘"
```

### 3. 적용

```
/reload-plugins
```

## 주요 커맨드

| 커맨드 | 플러그인 | 설명 |
|--------|----------|------|
| `/commit` | shared-conventions | 스테이징 확인 → 메시지 자동 생성 → 확인 후 커밋 |
| `/plan-feature <기능>` | planning | PRD/스펙 초안 작성 → `docs/handoff/<feature>/spec.md` |
| `/build-feature <기능>` | orchestrator | 기획→BE+Design(병렬)→FE→QA 전체 워크플로우 |
| `/release <version>` | orchestrator | 검증→테스트→빌드→버전 태깅 배포 파이프라인 |
| `/docs` | backend | API 문서 자동 생성 → `docs/API.md` |
| `/scaffold-component` | frontend | FSD 컴포넌트 + 테스트 stub 생성 |
| `/test_gen <file>` | qa | Jest 단위 테스트 자동 생성 |
| `/test_review` | qa | 변경 파일 코드 리뷰 → `REVIEW_결과.md` |

## /build-feature 워크플로우

```
/build-feature <feature>
       │
       ▼
[1] planning → spec.md → 승인 게이트 ✋
       │
       ▼
[2] backend ──────── [2] design  (병렬, worktree 격리)
    api-contract.md      tokens.ts
       │                     │
       └──────────┬──────────┘
                  ▼
         [3] frontend → FSD 슬라이스
                  │
                  ▼
         [4] QA 검증 루프 (최대 3회)
              code-reviewer + debugger
                  │
                  ▼
         [5] 최종 승인 게이트 ✋ → /release
```

## 플러그인 수정 가이드

### 수정 후 배포 흐름

```
플러그인 파일 수정
    ↓
plugin.json 버전 업 (선택)
    ↓
git push
    ↓
/plugin update <name>@claude-dev-workflow
    ↓
/reload-plugins
```

### 버전 관리 규칙

`plugins/<팀>/.claude-plugin/plugin.json`의 `version`을 수정합니다:

| 변경 종류 | 버전 규칙 | 예시 |
|----------|----------|------|
| 커맨드·스킬 내용 수정 | patch | `1.0.0` → `1.0.1` |
| 커맨드·스킬·에이전트 추가 | minor | `1.0.0` → `1.1.0` |
| 구조 대폭 변경 | major | `1.0.0` → `2.0.0` |

버전을 올리지 않아도 `/plugin update`로 최신 내용을 가져올 수 있습니다.

### 팀별 수정 예시

**shared-conventions 커밋 규칙 수정:**
```bash
# 1. 파일 수정
plugins/shared-conventions/commands/commit.md

# 2. 버전 업 (patch)
plugins/shared-conventions/.claude-plugin/plugin.json  → "version": "1.1.1"

# 3. 푸시
git add -A && git commit -m "fix: update commit rules" && git push

# 4. 업데이트 (Claude 대화창)
/plugin update shared-conventions@claude-dev-workflow
/reload-plugins
```

**backend 에이전트 추가:**
```bash
# 1. 에이전트 파일 생성
plugins/backend/agents/new-agent.md

# 2. 버전 업 (minor)
plugins/backend/.claude-plugin/plugin.json  → "version": "1.1.0"

# 3. 푸시 & 업데이트
git push
/plugin update backend@claude-dev-workflow
/reload-plugins
```

### 팀원에게 배포

플러그인 수정 후 팀원들도 동일하게 업데이트가 필요합니다:

```
/plugin update shared-conventions@claude-dev-workflow
/reload-plugins
```

또는 `settings.json`을 공유받은 경우 Claude 대화창에서:
```
플러그인 전체 업데이트해줘
```

---

## 팀별 포함 내용

### shared-conventions
| 종류 | 이름 | 설명 |
|------|------|------|
| Command | `/commit` | 스테이징 확인 → Conventional Commits 메시지 생성 → 확인 후 커밋 |
| Skill | `team-conventions` | 테스트 규칙, 브라우저 검증, 코딩 컨벤션 |

### planning
| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `planning` | PRD/스펙 작성 서브에이전트 |
| Command | `/plan-feature` | 기능 스펙 초안 작성 |
| Skill | `write-prd` | PRD 템플릿 및 작성 프로세스 |
| MCP | `linear` | Linear 이슈 트래커 연동 |

### backend
| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `backend` | Express API 구현 서브에이전트 |
| Agent | `api-design-reviewer` | API 설계 검토 서브에이전트 |
| Command | `/docs` | API 문서 자동 생성 |
| Skill | `backend-conventions` | 계층 구조, 에러 처리, Prisma 규칙 |
| Skill | `scaffold-api` | route/controller/service 스캐폴딩 |

### frontend
| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `frontend` | FSD 컴포넌트 구현 서브에이전트 |
| Command | `/scaffold-component` | FSD 컴포넌트 + 테스트 stub 생성 |
| Command | `/lint` | Biome lint 검사 및 자동 수정 |
| Command | `/build` | TypeCheck + 프로덕션 빌드 |
| Command | `/test` | Vitest + Playwright E2E 테스트 |
| Skill | `frontend-conventions` | FSD 레이어 경계, 네이밍, 스타일 규칙 |
| MCP | `figma` | Figma 디자인 토큰 연동 |

### design
| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `design` | Figma 토큰 추출 및 코드 변환 서브에이전트 |
| Skill | `tokens-to-code` | Figma → `tokens.ts` + Tailwind 테마 변환 |
| Skill | `design-system-guide` | 컴포넌트 상태, 접근성, Figma↔코드 매핑 |
| MCP | `figma` | Figma 디자인 파일 연동 |

### qa
| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `code-reviewer` | git diff 기반 보안/품질/성능 리뷰 |
| Agent | `debugger` | 에러 스택 추적 및 근본 원인 분석 |
| Command | `/test_gen <file>` | Jest 단위 테스트 자동 생성 |
| Command | `/test_review` | 변경 파일 코드 리뷰 → `REVIEW_결과.md` |
| Skill | `code-review` | 시니어 엔지니어 관점 코드 검토 |
| Hook | `protect-config.sh` | config 디렉토리 직접 수정 차단 |
| Hook | `format-on-save.sh` | 저장 시 자동 포맷 |
| MCP | `puppeteer` | localhost:3000 브라우저 자동 검증 |

### orchestrator
| 종류 | 이름 | 설명 |
|------|------|------|
| Command | `/build-feature <feature>` | 전체 기능 개발 워크플로우 |
| Command | `/release <version>` | 배포 파이프라인 |

## MCP 인증

| MCP | 인증 방식 |
|-----|----------|
| Linear | OAuth (브라우저 로그인) |
| Figma | OAuth (브라우저 로그인) |
| Puppeteer | 별도 인증 불필요 |

토큰은 개인 `~/.claude.json`에 저장되며 저장소에 커밋되지 않습니다.
