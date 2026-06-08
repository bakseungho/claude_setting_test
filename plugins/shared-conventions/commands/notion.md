# 업무일지 요약 생성

이번 주 작업 내역을 분석하여 `docs/notion-report.md`에 저장합니다.  
파일은 실행할 때마다 덮어씁니다.

## 1단계: 사용자 및 날짜 확인

```bash
git config user.name
```

현재 주의 월~금 날짜 범위를 계산합니다.  
예) 오늘이 2026-06-10(수)이면 → `2026.06.08~06.12`

## 2단계: 이번 주 작업 내역 수집

```bash
git log --since="last monday" --until="now" --oneline
git diff --stat HEAD~10 HEAD 2>/dev/null
```

`$ARGUMENTS`가 있으면 추가 메모로 포함합니다.

## 3단계: 요약 생성 및 파일 저장

아래 형식으로 `docs/notion-report.md`에 저장합니다 (덮어쓰기):

```markdown
## [담당자명] - [YYYY.MM.DD]

### 작업 내용
- [커밋 기반 요약 1]
- [커밋 기반 요약 2]
- [커밋 기반 요약 3]

### 메모
[/notion 뒤에 입력한 내용 — 없으면 이 섹션 생략]
```

저장 완료 후:

```
✅ docs/notion-report.md 저장 완료
Notion 업무일지에 복사해서 붙여넣기 하세요.
```

## 주의사항

- `.env`, `*.key` 파일 내용은 절대 포함하지 않습니다
- 커밋이 없는 경우 `$ARGUMENTS` 내용만 기록합니다
- `docs/` 폴더가 없으면 자동 생성합니다
