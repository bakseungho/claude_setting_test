# /build-feature — 병렬 DAG + 검증 루프

대상 기능: $ARGUMENTS

메인 세션이 지휘자 역할을 하며 역할별 서브에이전트에 작업을 파일 핸드오프 방식으로 위임합니다.
의존성 없는 단계는 병렬 실행, 의존성 있는 단계는 순차 실행합니다.

---

## 1단계: 기획 (순차)

`planning` 에이전트에 위임합니다.

- 입력: `$ARGUMENTS` (기능명 또는 Linear 이슈)
- 출력: `docs/handoff/$ARGUMENTS/spec.md`
- **승인 게이트**: spec.md 검토 후 사람 승인 필수

---

## 2단계: 백엔드 + 디자인 (병렬, worktree 격리)

spec.md 승인 후 `backend`와 `design` 에이전트를 동시에 실행합니다.

### backend 에이전트

- 입력: `docs/handoff/$ARGUMENTS/spec.md`
- 출력: `docs/handoff/$ARGUMENTS/api-contract.md`
- DB 스키마 변경 시 **승인 게이트** 필수

### design 에이전트

- 입력: `docs/handoff/$ARGUMENTS/spec.md` + Figma MCP
- 출력: `docs/handoff/$ARGUMENTS/design-notes.md`, `src/styles/tokens.ts`
- 글로벌 토큰 변경 시 **승인 게이트** 필수

두 에이전트 완료 후 결과물을 메인 브랜치에 병합합니다.

---

## 3단계: 프론트엔드 (순차)

`frontend` 에이전트에 위임합니다.

- 입력: `api-contract.md` + `design-notes.md` + `tokens.ts`
- 출력: FSD 슬라이스, `docs/handoff/$ARGUMENTS/frontend-notes.md`

---

## 4단계: QA 검증 루프 (최대 3회 반복)

`code-reviewer` + `debugger` 에이전트가 generator↔evaluator 패턴으로 동작합니다.

### 계약 단계

- generator(frontend)와 evaluator(qa) 간 `contract.md` 합의
  - 완료 기준 (acceptance criteria)
  - 검증 항목 체크리스트

### 빌드-검증 사이클

```
frontend 에이전트 (구현/수정)
    ↓
/lint + /build + /test 실행
    ↓
code-reviewer 에이전트 (정적 분석)
    ↓
Puppeteer로 실제 앱 동작 검증
    ↓
qa-report.md 작성 (PASS / FAIL)
```

- **PASS** → 사람 승인 게이트로 진행
- **FAIL** → 구체적인 수정 지시 → frontend 에이전트 재작업 (최대 3회)
- 3회 반복 후에도 실패 시 전략 재검토 필요

### 평가 기준

evaluator는 기준을 완화하지 않습니다. 단일 항목 실패도 FAIL 처리합니다.

---

## 5단계: 최종 승인 게이트

QA PASS 후 사람이 최종 검토합니다:

- [ ] spec.md 요구사항 모두 구현됨
- [ ] api-contract.md 와 구현이 일치함
- [ ] QA 리포트 PASS
- [ ] 기존 기능 회귀 없음

승인 완료 후 `/release` 커맨드로 배포를 진행합니다.

---

## 핸드오프 파일 구조

```
docs/handoff/$ARGUMENTS/
├── spec.md           ← planning 산출물
├── api-contract.md   ← backend 산출물
├── design-notes.md   ← design 산출물
├── frontend-notes.md ← frontend 산출물
└── qa-report.md      ← qa 산출물
```

## 주의사항

- 핸드오프 파일 누락 시 해당 단계에서 중단하고 확인 요청
- 작은 기능 변경은 검증 루프를 단축하거나 생략 가능
- 비가역적 작업(DB 마이그레이션, 배포, 글로벌 API 변경)은 반드시 승인 게이트
