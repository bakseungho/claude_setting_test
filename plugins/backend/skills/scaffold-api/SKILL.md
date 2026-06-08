---
name: scaffold-api
description: Express API 엔드포인트 스캐폴딩 — route/controller/service/DTO 파일 일괄 생성
when_to_use:
  - 새 API 리소스 추가 시 (예: /api/orders)
  - CRUD 엔드포인트 일괄 생성 시
user-invocable: true
---

# API 스캐폴딩

대상 리소스명을 받아 route → controller → service 파일을 생성합니다.

## 입력

- 리소스명: (예: `order`, `product`)
- HTTP 메서드: (예: GET, POST, PUT, DELETE)

## 생성 파일

```
src/
├── routes/{resource}.route.ts
├── controllers/{resource}.controller.ts
├── services/{resource}.service.ts
└── models/{resource}.type.ts
```

## 템플릿 규칙

- 파일명: `{resource-name}.{layer}.ts` (kebab-case)
- 클래스명: `{ResourceName}{Layer}` (PascalCase)
- 모든 메서드에 JSDoc 주석
- async/await + try-catch 적용
- Prisma client는 service 레이어에서만 사용
