# SciML 이론-현실 연결형 학습 가이드

> 이 저장소는 기존 단일 Markdown 문서를 역할별·주차별 문서로 분리한 버전입니다.  
> 원문은 `guide_notes/archive/ORIGINAL_FULL.md`에 그대로 보존되어 있습니다.

## 빠른 참조

| 상황 | 먼저 볼 문서 |
|---|---|
| 프로젝트 전체 목적을 확인할 때 | `guide_notes/README.md` |
| LLM에게 학습 맥락을 알려줄 때 | `guide_notes/LLM_CONTEXT.md` |
| 지금 어느 주차를 공부해야 하는지 볼 때 | `guide_notes/CURRICULUM.md` |
| 매주 어떤 형식으로 기록할지 볼 때 | `guide_notes/WORKFLOW.md` |
| 교재·논문·강의 자료를 찾을 때 | `guide_notes/RESOURCES.md` |
| LLM에게 질문할 프롬프트가 필요할 때 | `guide_notes/PROMPTS.md` |
| 폴더와 파일 역할을 확인할 때 | `guide_notes/PROJECT_STRUCTURE.md` |
| 실제 주차별 학습 내용을 볼 때 | `guide_notes/notes/weekXX_*.md` |
| 분리 전 원문 전체가 필요할 때 | `guide_notes/archive/ORIGINAL_FULL.md` |

## LLM 사용 지표

LLM은 답변 전 다음 순서로 문서를 참고한다.

1. 사용자의 전체 학습 맥락이 필요하면 `guide_notes/LLM_CONTEXT.md`를 본다.
2. 특정 주차의 핵심 질문이 필요하면 `guide_notes/CURRICULUM.md`에서 주차를 확인한 뒤 `guide_notes/notes/weekXX_*.md`를 본다.
3. 자료 추천이 필요하면 `guide_notes/RESOURCES.md`를 본다.
4. 답변 형식이 애매하면 `guide_notes/WORKFLOW.md`와 `guide_notes/PROMPTS.md`를 본다.
5. Lean 4 또는 Julia의 역할이 애매하면 `guide_notes/LLM_CONTEXT.md`를 우선한다.
6. 원문 누락 여부를 확인해야 하면 `guide_notes/archive/ORIGINAL_FULL.md`를 본다.

---

## 0. 문서 목적

이 문서는 SciML을 올바르게 다루기 위한 개인 학습 가이드이다.

이 커리큘럼은 단순히 SciML 라이브러리를 사용하는 법을 배우기 위한 것이 아니다.  
목표는 다음과 같다.

> **SciML에서 사용되는 수학적 구조가 왜 필요한지 이해하고,  
> 그 구조가 실제 계산·데이터·모델링 문제로 내려올 때 무엇이 바뀌는지 설명할 수 있게 되는 것.**

이 문서는 두 가지 용도로 사용한다.

1. **학습자 본인용**
    - 매주 무엇을 질문해야 하는지 확인한다.
    - 어떤 자료를 읽어야 하는지 확인한다.
    - 결과물을 어떤 형식으로 남길지 확인한다.
        
2. **LLM / AI 어시스턴트용**
    - 사용자가 어떤 맥락에서 질문하는지 이해한다.
    - 교재 진도 중심이 아니라, 핵심 질문에 답하는 방식으로 돕는다.
    - Lean 4와 Julia 실험의 역할을 구분해서 지원한다.

---


## 1. 핵심 운영 철학

이 커리큘럼은 다음 방식으로 진행한다.

```text
핵심 질문/문제를 먼저 정한다
→ 그 질문에 답하기 위해 필요한 자료만 읽는다
→ 답변을 자연어 글로 정리한다
→ 답변의 수학적 구조를 Lean 4 코드로 남긴다
→ 답변의 현실적 의미를 Julia 실험으로 확인한다
→ 확장 키워드와 참고 자료를 연결해둔다
```

즉, 이 커리큘럼은 **교재를 따라가는 커리큘럼이 아니라, 질문에 답하기 위해 교재를 사용하는 커리큘럼**이다.

---
