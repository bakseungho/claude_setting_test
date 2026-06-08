# 테스트 코드 자동 생성

대상: $ARGUMENTS

## 1단계: 소스 분석

`$ARGUMENTS` 파일을 읽고 다음을 식별합니다:

- export된 모든 함수와 클래스
- 각 함수의 매개변수 타입과 반환 타입
- 의존성(import)과 외부 호출

## 2단계: 테스트 케이스 설계

각 함수에 대해 3가지 케이스를 설계합니다:

**정상 케이스**: 올바른 입력으로 예상된 출력이 나오는지 확인
**경계 케이스**: 빈 배열, 0, 최대값, 최소값 등 경계 조건 확인
**오류 케이스**: 잘못된 타입, null, undefined 입력 시 오류 처리 확인

## 3단계: 테스트 파일 작성

**Jest 29.x + TypeScript** 기준으로 작성합니다.

```typescript
describe('{ClassName}', () => {
  it('should {expected behavior} when {condition}', async () => {
    // Given
    // When
    // Then
  })
})
```

규칙:
- Prisma는 반드시 mock (`jest.mock('@prisma/client')`)
- `sleep` / `setTimeout` 금지
- `any` 타입 금지

## 4단계: 파일 저장

파일명: `tests/{src와_동일한_경로}/{원본파일명}.test.ts`

예: `src/services/user.service.ts` → `tests/services/user.service.test.ts`
