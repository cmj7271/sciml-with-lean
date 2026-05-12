<!--
LLM 참고 지표:
- 이 문서는 Week 1의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

## Week 1 — Norm / Metric / Convergence

### 핵심 질문

> SciML에서 “두 해가 가깝다”는 말은 무엇을 의미하는가?

### 내가 해결해야 할 문제

SciML에서는 참해, 수치해, 관측 데이터, neural network output을 계속 비교한다.  
그런데 “비교한다”는 말은 항상 metric 또는 norm을 전제로 한다.

이번 주 문제:

```text
loss, residual, error metric은 어떤 norm을 전제로 하는가?
```

### 질문 이해를 위한 기본 자료

- Kreyszig:
    - metric space
    - normed space
    - convergence
    - Cauchy sequence
    - complete space
- MIT 18.06:
    - vector space
    - norm
    - inner product

### 답변을 위한 자료

- L2 norm
- sup norm
- pointwise error
- residual norm

### 내 답변 목표

```text
SciML에서 “가깝다”는 말은 절대적인 말이 아니다.
어떤 norm을 선택하느냐에 따라 같은 두 함수도 다르게 평가된다.
따라서 loss function은 단순 구현 선택이 아니라,
어떤 오류를 중요하게 볼지 정하는 수학적 선택이다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Kreyszig/ch1_norm_metric.lean
```

남길 정의:

```lean
class MetricSpace (α : Type) where
  dist : α → α → ℝ
  dist_self : ∀ x, dist x x = 0
  symm : ∀ x y, dist x y = dist y x
  triangle : ∀ x y z, dist x z ≤ dist x y + dist y z
```

작성할 구조:

- `MetricSpace`
- `NormedSpace`
- `ConvergesTo`
- `CauchySeq`
- `Complete`

정리 statement:

- `convergent_is_cauchy`
- `limit_unique`    

Proof skeleton:
- 수렴수열이 Cauchy sequence가 되는 이유

### Julia 실험

실험 목적:

```text
같은 오차라도 norm에 따라 평가가 달라진다는 것을 확인한다.
```

Toy problem:

```julia
u(x)  = sin(x)
u1(x) = sin(x) + local_spike
u2(x) = sin(x) + small_global_bias
```

비교:

- pointwise error
- L2 error
- sup error

관찰할 것:

```text
local spike는 L2에서는 작게 보일 수 있지만 sup norm에서는 크게 보인다.
global bias는 전체적으로 누적되므로 L2에서 더 크게 보일 수 있다.
따라서 모델 평가 기준은 오류의 종류를 선택한다.
```

### SciML 매핑

- PINN loss
- Neural Operator error metric
- SINDy residual
- weak-form residual

### 확장 키워드

- Banach space
- Hilbert space
- Sobolev norm
- operator norm
- stability estimate

### 이번 주의 한 문장

> **Norm은 SciML에서 loss와 error를 말하기 위한 수학적 언어다.**

---
