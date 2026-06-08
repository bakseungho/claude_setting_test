# 릴리즈 파이프라인

버전: $ARGUMENTS (예: /release 1.2.0)

전체 릴리즈 프로세스를 순서대로 실행합니다. 각 단계가 실패하면 즉시 중단하고 원인을 보고합니다.

## 1단계: 코드 품질 검증

`code-reviewer` 에이전트를 통해 변경 사항을 검토합니다.
Critical 또는 High 이슈가 발견되면 여기서 중단합니다.

## 2단계: 테스트 실행

```bash
npm test
```
실패한 테스트가 있으면 중단합니다. 실패 시 `debugger` 에이전트로 원인 분석합니다.

## 3단계: 빌드 확인

```bash
npm run build
```
빌드 오류가 있으면 중단합니다.

## 4단계: 버전 업데이트

`package.json`의 버전을 `$ARGUMENTS`로 업데이트합니다.
CHANGELOG.md 상단에 이번 버전의 변경 사항을 추가합니다.

## 5단계: Git 태그 생성 (승인 게이트)

다음 작업은 사람 승인 후 진행합니다:

```bash
git add package.json CHANGELOG.md
git commit -m "chore: release v$ARGUMENTS"
git tag -a v$ARGUMENTS -m "Release v$ARGUMENTS"
```

## 6단계: 완료 보고

릴리즈 준비가 완료되었습니다. 다음 명령으로 원격 저장소에 푸시합니다:
`git push origin main --tags`
(실제 푸시는 사용자가 직접 실행합니다.)
