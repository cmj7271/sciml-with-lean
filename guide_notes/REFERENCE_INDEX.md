# Reference Index

이 문서는 사람과 LLM이 “어떤 상황에서 어떤 문서를 봐야 하는지” 빠르게 판단하기 위한 지표이다.

## 1. 상황별 참조 문서

| 상황 | 참고 문서 | 이유 |
|---|---|---|
| 전체 프로젝트의 목적을 파악해야 한다 | `README.md` | 문서 목적과 핵심 운영 철학이 들어 있다. |
| LLM이 사용자의 학습 맥락을 이해해야 한다 | `LLM_CONTEXT.md` | 사용자의 목표, 답변 원칙, Lean 4와 Julia의 역할이 들어 있다. |
| 12주 전체 흐름을 확인해야 한다 | `CURRICULUM.md` | 각 주차가 어떤 순서로 이어지는지 확인한다. |
| 특정 주차를 실제로 공부해야 한다 | `notes/weekXX_*.md` | 핵심 질문, 자료, Lean 4, Julia 실험, SciML 매핑이 주차별로 들어 있다. |
| 이번 주 노트를 어떤 형식으로 쓸지 정해야 한다 | `WORKFLOW.md` | 매주 고정 작업 템플릿이 들어 있다. |
| 읽을 자료를 골라야 한다 | `RESOURCES.md` | 기초 수학, 코어 이론, SciML 브릿지 자료가 정리되어 있다. |
| LLM에게 질문을 던질 템플릿이 필요하다 | `PROMPTS.md` | 주차 시작, 논문/교재 읽기, Lean 4, Julia 실험 보조용 프롬프트가 있다. |
| 폴더 구조와 파일 배치를 확인해야 한다 | `PROJECT_STRUCTURE.md` | 프로젝트 구조 권장안이 들어 있다. |
| 분리 전 원문 전체를 확인해야 한다 | `archive/ORIGINAL_FULL.md` | 원본 문서를 그대로 보존한 파일이다. |

## 2. LLM 답변 전 확인 순서

### 개념 설명 요청일 때

1. `LLM_CONTEXT.md`
2. 관련 `notes/weekXX_*.md`
3. 필요하면 `RESOURCES.md`

### 특정 주차 진행 요청일 때

1. `CURRICULUM.md`
2. 해당 `notes/weekXX_*.md`
3. `WORKFLOW.md`
4. 필요하면 `PROMPTS.md`

### 논문 또는 교재 읽기 보조 요청일 때

1. `LLM_CONTEXT.md`
2. 해당 주차 `notes/weekXX_*.md`
3. `RESOURCES.md`
4. `PROMPTS.md`의 논문/교재 읽기 보조용 템플릿

### Lean 4 코드 구조화 요청일 때

1. `LLM_CONTEXT.md`의 Lean 4 역할 설명
2. 해당 주차 `notes/weekXX_*.md`의 Lean 4 기록
3. `PROMPTS.md`의 Lean 4 보조용 템플릿

### Julia 실험 요청일 때

1. `LLM_CONTEXT.md`의 Julia 실험 역할 설명
2. 해당 주차 `notes/weekXX_*.md`의 Julia 실험
3. `PROMPTS.md`의 Julia 실험 보조용 템플릿

### 자료 추천 요청일 때

1. `RESOURCES.md`
2. 해당 주차 `notes/weekXX_*.md`의 기본 자료 / 답변 자료 / 확장 키워드
3. 필요하면 `CURRICULUM.md`로 전체 흐름 확인

## 3. 주차별 상세 문서 위치

| 주차 | 주제 | 문서 |
|---|---|---|
| Week 1 | Norm / Metric / Convergence | `notes/week01_norm_metric.md` |
| Week 2 | Hilbert Space / Projection / Least Squares | `notes/week02_projection_least_squares.md` |
| Week 3 | Banach Fixed Point / Iteration | `notes/week03_fixed_point.md` |
| Week 4 | ODE Existence / Uniqueness / Flow | `notes/week04_ode_flow.md` |
| Week 5 | Numerical Error / Solver Stability | `notes/week05_solver_stability.md` |
| Week 6 | PDE / Conservation / Boundary Condition | `notes/week06_pde_conservation.md` |
| Week 7 | Weak Derivative / Weak Form / Test Function | `notes/week07_weak_form.md` |
| Week 8 | Variational Form / Lax–Milgram | `notes/week08_variational_lax_milgram.md` |
| Week 9 | Galerkin / Céa Lemma / Approximation | `notes/week09_galerkin_cea.md` |
| Week 10 | Inverse Problem / Ill-posedness / Identifiability | `notes/week10_inverse_problem.md` |
| Week 11 | Regularization / Tikhonov / Spectral Filtering | `notes/week11_regularization.md` |
| Week 12 | SciML Mapping / Method Comparison | `notes/week12_sciml_mapping.md` |

## 4. 원문 보존 원칙

- 기존 단일 md의 전체 내용은 `archive/ORIGINAL_FULL.md`에 그대로 보존한다.
- 역할별 문서에는 원문 내용을 재배치하되, 필요한 경우 안내 문구를 추가한다.
- 주차별 상세 내용은 `notes/` 아래로 분리한다.
- 내용이 누락되었는지 확인할 때는 항상 `archive/ORIGINAL_FULL.md`를 기준으로 삼는다.
