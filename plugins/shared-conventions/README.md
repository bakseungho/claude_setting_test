# shared-conventions 플러그인

팀 공통 코딩/협업 규칙의 Single Source of Truth입니다. 모든 역할 플러그인이 이 규칙을 전제로 동작합니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Skill | `team-conventions` | 테스트 규칙, 브라우저 검증 절차, 코딩 컨벤션 통합 |

## 규칙 요약

- **테스트**: Given-When-Then 패턴, 커버리지 80% 이상, DB Mock 필수
- **브라우저 검증**: Puppeteer MCP로 `localhost:3000` 검증
- **코딩**: kebab-case 파일명, any 타입 금지, async/await 필수
