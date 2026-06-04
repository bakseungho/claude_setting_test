# API 문서 자동 생성

프로젝트의 API 엔드포인트를 분석하여 문서를 생성합니다.

## 1단계: 라우터 파일 탐색

`src/` 디렉토리에서 `*route*`, `*controller*`, `*router*` 패턴의 파일을 찾습니다.

## 2단계: 엔드포인트 추출

각 파일에서 다음 정보를 추출합니다:

- HTTP 메서드 (GET / POST / PUT / DELETE / PATCH)
- 경로 (예: /api/users/:id)
- Path 파라미터, Query 파라미터, Request Body 구조
- 응답 형식과 HTTP 상태 코드
- JSDoc 주석이 있다면 해당 설명

## 3단계: Markdown 문서 생성

다음 형식으로 `docs/API.md`를 작성합니다:

- 엔드포인트별 섹션
- 각 섹션에 파라미터 표, 예시 요청/응답 포함
- 목차 자동 생성
