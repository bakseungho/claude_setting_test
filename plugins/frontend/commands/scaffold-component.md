# 컴포넌트 스캐폴딩

대상: $ARGUMENTS (예: `Button`, `feature/auth`, `route/dashboard`)

`frontend-conventions` 스킬 기준으로 컴포넌트 파일과 테스트 stub을 생성합니다.

## 1단계: 인수 파싱

`$ARGUMENTS`에서 컴포넌트명, 카테고리(ui/feature/route), client 여부를 추출합니다.
모호한 경우 사용자에게 확인합니다.

## 2단계: 파일 생성

FSD 컨벤션에 따라 컴포넌트 파일과 Vitest 테스트 stub을 생성합니다.

## 3단계: 디자인 토큰 적용

`src/styles/tokens.ts`에서 디자인 토큰을 확인하고 컴포넌트에 적용합니다.
raw 값(`#FF0000`, `16px`) 직접 사용 금지.

## 4단계: 결과 보고

생성된 파일 경로를 보고합니다.
