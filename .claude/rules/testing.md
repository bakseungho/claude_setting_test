# 테스트 작성 규칙

## 필수 규칙

- 모든 새 함수에 단위 테스트 작성
- 테스트 파일명: {함수명}.test.ts
- Given-When-Then 주석 패턴 사용
- 커버리지 80% 이상 유지

## 금지 사항

- 실제 DB 연결 테스트 금지 (Mock 사용)
- sleep/setTimeout 사용 금지
