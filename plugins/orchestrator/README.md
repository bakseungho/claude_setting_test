# orchestrator 플러그인

전체 워크플로우 진입점입니다. 메인 세션이 지휘자 역할을 하여 역할별 서브에이전트에 작업을 파일 핸드오프 방식으로 위임합니다.

## 포함 내용

| 종류 | 이름 | 설명 |
|------|------|------|
| Command | `/build-feature <feature>` | 기획→BE+Design(병렬)→FE→QA 전체 기능 개발 워크플로우 |
| Command | `/release <version>` | 코드 검증→테스트→빌드→버전 태깅 배포 파이프라인 |

## /build-feature 워크플로우

```
/build-feature <feature>
         │
         ▼
  [1] planning 에이전트
      → spec.md
      → 승인 게이트 ✋
         │
         ▼
  [2] backend ──────────── [2] design 에이전트
      에이전트 (병렬)              (병렬)
      → api-contract.md      → design-notes.md
      → 승인 게이트 ✋         → tokens.ts
         │                        │
         └──────────┬─────────────┘
                    ▼
           [3] frontend 에이전트
               → FSD 슬라이스
               → frontend-notes.md
                    │
                    ▼
           [4] QA 검증 루프 (최대 3회)
               code-reviewer + debugger
               → qa-report.md (PASS/FAIL)
                    │
                    ▼
           [5] 최종 승인 게이트 ✋
                    │
                    ▼
              /release <version>
```

## 핵심 설계 원칙

- **병렬 실행**: backend와 design은 동시에 실행 (worktree 격리)
- **파일 핸드오프**: `docs/handoff/<feature>/`로 단계 간 결과물 전달
- **generator↔evaluator**: QA는 구현자(frontend)와 분리된 독립 평가자
- **승인 게이트**: 비가역적 작업 전 반드시 사람 승인

## 핸드오프 파일 구조

```
docs/handoff/<feature>/
├── spec.md           ← planning
├── api-contract.md   ← backend
├── design-notes.md   ← design
├── frontend-notes.md ← frontend
└── qa-report.md      ← qa
```

## 승인 게이트 목록

| 단계 | 게이트 조건 |
|------|------------|
| planning 완료 | spec.md 검토 및 승인 |
| backend DB 변경 | 스키마 변경 / 마이그레이션 |
| design 글로벌 변경 | 전역 토큰 수정 |
| QA PASS | 최종 merge 전 검토 |
