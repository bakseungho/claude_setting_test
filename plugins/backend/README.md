# backend 플러그인

Node.js/Express API 개발을 담당하는 BE 역할 하네스입니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Agent | `backend` | Express API 구현 담당 서브에이전트 (worktree 격리) |
| Agent | `api-design-reviewer` | API 설계 검토 전문 서브에이전트 |
| Command | `/docs` | src/ 라우터·컨트롤러에서 API 문서 자동 생성 |
| Skill | `backend-conventions` | 계층 구조, 에러 처리, Prisma 사용 규칙 |
| Skill | `scaffold-api` | route/controller/service 파일 일괄 스캐폴딩 |

## 멀티 에이전트 흐름

```
spec.md 입력
    ↓
backend 에이전트 (구현)
    ↓
api-design-reviewer 에이전트 (검토)
    ↓
api-contract.md 출력
```

## 승인 게이트

DB 스키마 변경 / 마이그레이션은 사람 승인 필수.
