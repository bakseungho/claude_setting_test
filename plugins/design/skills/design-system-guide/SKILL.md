---
name: design-system-guide
description: 디자인 시스템 기준 가이드 — 컴포넌트 상태, 접근성, Figma↔코드 매핑
when_to_use:
  - 컴포넌트 구현 시 디자인 일관성 확인
  - 코드 리뷰에서 디자인 컨벤션 참조
  - 디자인 시스템 확장 시
user-invocable: false
---

# 디자인 시스템 가이드

## 핵심 원칙

- **토큰 우선** — raw 값(`#FF0000`, `16px`) 하드코딩 금지, 반드시 토큰 참조
- **Variant/Size/State** 명명 규칙 준수

## 컴포넌트 상태

모든 인터랙티브 컴포넌트는 다음 상태를 구현합니다:

| 상태 | 설명 |
|------|------|
| `default` | 기본 상태 |
| `hover` | 마우스 오버 |
| `active` | 클릭/포커스 |
| `disabled` | 비활성화 |
| `loading` | 로딩 중 |

## 접근성 기준

- 명암비: 텍스트 4.5:1 이상, 대형 텍스트 3:1 이상
- 포커스 링: 모든 인터랙티브 요소에 visible focus 필수
- ARIA: role, aria-label, aria-describedby 적절히 사용

## Figma↔코드 매핑

| Figma 컴포넌트 | 코드 위치 | 토큰 |
|----------------|-----------|------|
| Button/Primary | `shared/ui/Button` | `colors.primary` |
| Input/Default | `shared/ui/Input` | `colors.semantic` |
| (팀 스펙에 따라 확장) | | |
