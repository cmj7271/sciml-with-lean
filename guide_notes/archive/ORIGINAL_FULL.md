# SciML 이론-현실 연결형 학습 가이드

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

## 2. LLM / AI 어시스턴트가 이해해야 할 맥락

### 2.1 학습자의 목표

학습자는 SciML 연구를 위해 다음 기반지식을 쌓고자 한다.

- 함수해석
- ODE / Dynamical Systems
- PDE / Weak Form
- Galerkin / FEM의 이론적 의미
- Inverse Problem
- Regularization
- Weak SINDy / WENDy
- Deep Ritz / PINN / Neural Operator 등 SciML 방법론의 이론적 기반

학습자는 단순 구현보다 다음 질문에 관심이 있다.

```text
왜 이런 수학이 필요한가?
이 이론은 현실 데이터의 어떤 문제를 해결하는가?
SciML 방법론은 이 이론을 어떻게 변형해서 사용하는가?
이론의 가정이 깨지면 어떤 문제가 생기는가?
```

---

## 3. LLM 응답 원칙

LLM은 이 커리큘럼을 도울 때 다음 원칙을 따른다.

### 3.1 교재 진도 중심으로 답하지 않는다

좋지 않은 방식:

```text
Kreyszig Ch.1–2를 모두 읽으세요.
Evans Ch.5를 정독하세요.
```

좋은 방식:

```text
이번 질문에 답하려면 Kreyszig의 norm, convergence, complete 개념만 먼저 보면 됩니다.
bounded operator는 지금은 확장 키워드로 두고, 나중에 stability와 연결할 때 보세요.
```

---

### 3.2 항상 핵심 질문을 중심에 둔다

예를 들어, 사용자가 weak form을 물으면 단순히 정의부터 설명하지 않는다.

좋은 중심 질문:

```text
noisy data에서 직접 미분하지 않고 방정식 정보를 쓸 수 있는가?
```

그다음 설명 순서는 다음과 같다.

```text
현실 문제:
noisy data를 직접 미분하면 불안정하다.

이론:
integration by parts와 test function을 사용해 미분을 데이터가 아니라 test function 쪽으로 옮긴다.

SciML 연결:
Weak SINDy, WENDy, weak-form regression에서 사용된다.
```

---

### 3.3 이론과 현실 연결을 분리해서 설명한다

답변은 가능한 한 다음 구조를 따른다.

```text
1. 이론적으로는 무엇인가?
2. 왜 필요한가?
3. 현실 계산/데이터에서는 어떤 문제가 생기는가?
4. SciML에서는 어디에 쓰이는가?
5. Lean 4로는 어떤 구조를 남길 수 있는가?
6. Julia로는 어떤 작은 실험을 하면 되는가?
```

---

### 3.4 Lean 4는 완전 증명 도구가 아니라 구조화 도구로 본다

Lean 4의 역할은 다음이다.

```text
정의가 무엇인지 명확히 한다.
어떤 가정이 필요한지 드러낸다.
정리의 결론이 정확히 무엇인지 statement로 남긴다.
proof skeleton으로 증명 흐름을 기록한다.
```

원칙:

```text
def/class: 3~5개
theorem: 1~2개
proof skeleton: 1개
증명은 원칙적으로 by sorry 허용
20분 이상 타입 오류로 막히면 주석 처리 후 진행
```

Lean 4 공식 자료는 propositions, tactics, structures, type classes 등을 다루므로, 이 커리큘럼에서는 “완전 증명”보다 “수학적 구조를 명시하는 도구”로 사용한다. ([leanprover.github.io](https://leanprover.github.io/theorem_proving_in_lean4/?utm_source=chatgpt.com "Theorem Proving in Lean 4"))

---

### 3.5 Julia 실험은 구현 프로젝트가 아니라 이론 확인 장치로 본다

Julia 실험의 목적은 성능을 내는 것이 아니다.

목적은 다음이다.

```text
이론이 말하는 현상이 실제 계산에서도 보이는가?
가정이 깨지면 어떤 문제가 생기는가?
noise, discretization, solver error가 결과를 어떻게 바꾸는가?
```

실험 규모 제한:

```text
그림 1개
핵심 수치 비교 1개
관찰 5문장
```

ODE 실험은 DifferentialEquations.jl의 Getting Started 문서를 기본 출발점으로 삼는다. 해당 튜토리얼은 Julia에서 ODE를 푸는 기능을 소개한다. ([docs.sciml.ai](https://docs.sciml.ai/DiffEqDocs/stable/getting_started/?utm_source=chatgpt.com "Getting Started with Differential Equations in Julia"))

---

### 3.6 확장 자료는 읽지 않고 연결만 한다

매주 자료는 세 층으로 나눈다.

```text
1. 질문 이해를 위한 기본 자료
2. 답변을 위한 자료
3. 확장 키워드 / 나중에 읽을 자료
```

규칙:

```text
기본 자료는 읽는다.
답변 자료는 필요한 만큼만 확인한다.
확장 자료는 지금 읽지 않고 연결만 한다.
```

---

## 4. 매주 고정 작업 템플릿

매주 다음 템플릿으로 정리한다.

```markdown
# Week N — 주제

## 1. 핵심 질문

> 이번 주에 반드시 답해야 하는 질문

## 2. 내가 해결해야 할 문제

이 질문이 SciML에서 왜 중요한가?

## 3. 질문 이해를 위한 기본 자료

질문을 이해하기 위해 최소한 읽어야 하는 자료

## 4. 답변을 위한 자료

내 답변을 더 정확하게 만들기 위해 확인할 자료

## 5. 내 답변

질문에 대한 자연어 답변

## 6. Lean 4 기록

답변의 수학적 구조를 def, class, theorem, proof skeleton으로 남긴다.

## 7. Julia 실험

답변의 현실적 의미를 작은 실험으로 확인한다.

## 8. SciML 매핑

이 개념이 SciML 어디에 연결되는지 정리한다.

## 9. 확장 키워드

지금은 읽지 않고, 나중에 볼 키워드만 연결한다.

## 10. 이번 주의 한 문장

“_____ 는 _____ 를 위해 필요하다.”
```

---

## 5. 공통 참고 자료

### 5.1 기초 수학 자료

#### MIT 18.06 Linear Algebra

용도:
- least squares
- projection
- eigenvalue
- positive definite matrix
- SVD의 기초 보강

MIT 18.06은 systems of equations, vector spaces, determinants, eigenvalues, similarity, positive definite matrices 등을 다루는 선형대수 강의다. ([MIT OpenCourseWare](https://ocw.mit.edu/courses/18-06-linear-algebra-spring-2010/?utm_source=chatgpt.com "Linear Algebra | Mathematics"))

---

#### MIT 18.03SC Differential Equations

용도:
- ODE 모델링
- 해석적 풀이
- 해의 의미
- 과학·공학 모델링 감각 보강

MIT 18.03SC는 자연 법칙을 미분방정식으로 모델링하고, 그 방정식을 풀고 해석하는 데 초점을 둔 독학형 강의다. ([MIT OpenCourseWare](https://ocw.mit.edu/courses/18-03sc-differential-equations-fall-2011/?utm_source=chatgpt.com "Differential Equations | Mathematics"))

---

#### MIT 18.330 Introduction to Numerical Analysis

용도:
- numerical error
- stability    
- ODE solver
- approximation
- numerical linear algebra

MIT 18.330은 numerical analysis 입문 자료로, root finding, interpolation, approximation, integration, differential equations, linear algebra의 direct/iterative method 등을 다룬다. ([Massachusetts Institute of Technology](https://www.mit.edu/?utm_source=chatgpt.com "MIT - Massachusetts Institute of Technology"))

---

#### MIT 18.05 Introduction to Probability and Statistics

용도:
- noise
- uncertainty
- inference
- regression
- confidence interval
- likelihood

MIT 18.05는 probability distributions, Bayesian inference, hypothesis testing, confidence intervals, linear regression 등을 포함하는 확률·통계 입문 강의다. ([MIT OpenCourseWare](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2022/?utm_source=chatgpt.com "Introduction to Probability and Statistics | Mathematics"))

---

### 5.2 코어 이론 교재

#### Kreyszig — Introductory Functional Analysis with Applications

사용 목적:
- metric space
- normed space
- Banach space
- Hilbert space
- bounded linear operator
- projection
- compactness / spectral idea

---

#### Teschl — Ordinary Differential Equations and Dynamical Systems

사용 목적:
- existence / uniqueness
- Picard iteration
- Grönwall inequality
- flow map
- dynamical systems 관점

---

#### Evans — Partial Differential Equations

사용 목적:
- 대표 PDE
- weak derivative
- Sobolev space
- weak solution
- energy method
- Lax–Milgram

---

#### Brenner & Scott — The Mathematical Theory of Finite Element Methods

사용 목적:
- Sobolev basics
- variational formulation
- Galerkin approximation
- Céa lemma

---

#### Kirsch — An Introduction to the Mathematical Theory of Inverse Problems

사용 목적:
- well-posedness
- ill-posedness
- regularization
- Tikhonov
- spectral filtering
- discretization as regularization

Kirsch의 책은 inverse problem, ill-posed problem, regularization method의 기본 어려움을 다루는 대학원 수준 교재로 소개되어 있다. ([Springer](https://link.springer.com/book/10.1007/978-3-030-63343-1?utm_source=chatgpt.com "An Introduction to the Mathematical Theory of Inverse Problems"))

---

### 5.3 SciML 브릿지 자료

#### Deep Ritz Method

용도:
- variational problem
- weak form
- energy minimization
- neural network trial function    

Deep Ritz 논문은 PDE에서 나오는 variational problem을 deep learning 기반으로 풀기 위한 방법을 제안한다. ([arXiv](https://arxiv.org/abs/1710.00211?utm_source=chatgpt.com "The Deep Ritz method: A deep learning-based numerical algorithm for solving variational problems"))

---

#### SINDy

용도:
- equation discovery
- sparse regression
- dynamical system identification

SINDy 논문은 measurement data에서 governing physical equation을 발견하기 위해 sparsity-promoting techniques, machine learning, nonlinear dynamical systems를 결합한다. ([arXiv](https://arxiv.org/abs/1509.03580?utm_source=chatgpt.com "Sparse identification of nonlinear dynamical systems"))

---

#### WENDy

용도:
- weak-form regression
- ODE parameter estimation
- noisy data
- solver-free inference

WENDy는 weak-form 기반으로 nonlinear ODE parameter를 추정하며, numerical differential equation solver에 의존하지 않고 measurement noise에 robust한 추정을 목표로 한다. ([arXiv](https://arxiv.org/abs/2302.13271?utm_source=chatgpt.com "Direct Estimation of Parameters in ODE Models Using WENDy: Weak-form Estimation of Nonlinear Dynamics"))

---

#### Fourier Neural Operator

용도:
- neural operator
- function space mapping
- PDE solution operator
- Fourier-space parameterization

FNO 논문은 기존 neural network가 finite-dimensional Euclidean space 사이의 mapping을 학습하는 데 집중한 반면, neural operator는 function space 사이의 mapping을 학습한다는 관점에서 출발한다. ([arXiv](https://arxiv.org/abs/2010.08895?utm_source=chatgpt.com "Fourier Neural Operator for Parametric Partial Differential Equations"))

---

#### Spectral Bias

용도:
- neural network의 주파수 학습 경향
- PDE 해의 고주파 성분
- Fourier analysis와 learning dynamics 연결

Rahaman et al.은 neural network가 low-frequency function을 더 빠르게 학습하는 경향을 Fourier analysis 관점에서 설명한다. ([Proceedings of Machine Learning Research](https://proceedings.mlr.press/v97/rahaman19a.html?utm_source=chatgpt.com "On the Spectral Bias of Neural Networks"))

---

## 6. 프로젝트 구조 권장안

```text
.
├── README.md
├── LLM_CONTEXT.md
├── CURRICULUM.md
├── GEMINI.md
├── notes/
│   ├── week01_norm_metric.md
│   ├── week02_projection_least_squares.md
│   └── ...
├── notebooks/
│   ├── week01_norm_comparison.jl
│   ├── week02_least_squares_projection.jl
│   └── ...
├── SciML/
│   ├── Basic.lean
│   ├── Kreyszig/
│   │   ├── ch1_norm_metric.lean
│   │   ├── ch2_hilbert_projection.lean
│   │   └── ch3_fixed_point.lean
│   ├── Teschl/
│   │   └── ch4_ode_flow.lean
│   ├── Numerics/
│   │   └── ch5_error_stability.lean
│   ├── Evans/
│   │   ├── ch6_pde_big_picture.lean
│   │   ├── ch7_weak_form.lean
│   │   └── ch8_lax_milgram.lean
│   ├── BrennerScott/
│   │   └── ch9_galerkin_cea.lean
│   ├── Kirsch/
│   │   ├── ch10_inverse_problem.lean
│   │   └── ch11_regularization.lean
│   └── SciML_Mapping.lean
└── SciML.lean
```

---

## 7. 12주 질문 중심 커리큘럼

---

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

## Week 2 — Hilbert Space / Projection / Least Squares

### 핵심 질문

> 데이터가 모델 공간에 정확히 놓이지 않을 때, 어떤 해를 고르는가?

### 내가 해결해야 할 문제

실험 데이터는 보통 모델이 정확히 설명하지 못한다.  
따라서 exact solution이 아니라 **best approximation**을 찾는다.

### 질문 이해를 위한 기본 자료

- Kreyszig:
    
    - inner product space
        
    - Hilbert space
        
    - orthogonality
        
    - projection
        
- MIT 18.06:
    
    - least squares
        
    - projection
        
    - normal equation
        

### 답변을 위한 자료

- least squares
    
- normal equation
    
- orthogonal projection
    
- column space
    

### 내 답변 목표

```text
Least squares는 단순 최적화 기법이 아니라,
관측 데이터 벡터를 모델이 표현할 수 있는 부분공간으로 직교투영하는 문제다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Kreyszig/ch2_hilbert_projection.lean
```

남길 정의:

- `InnerProductSpace`
    
- `Orthogonal`
    
- `Projection`
    
- `ClosedSubspace`
    
- `LeastSquaresSolution`
    

정리 statement:

- projection error는 subspace에 직교한다.
    
- least squares solution은 normal equation을 만족한다.
    

Proof skeleton:

- least squares normal equation 유도
    

### Julia 실험

Toy problem:

```julia
y = a*x + b + noise
```

확인:

- design matrix `A`
    
- column space
    
- residual `r = y - Aβ`
    
- `A' * r ≈ 0`
    

### SciML 매핑

- SINDy coefficient estimation
    
- PINN residual minimization
    
- Galerkin projection
    
- neural operator training loss
    

### 확장 키워드

- Riesz representation
    
- Moore–Penrose inverse
    
- SVD
    
- regularized least squares
    
- weighted least squares
    

### 이번 주의 한 문장

> **Least squares는 noisy data에서 가장 가까운 모델을 찾는 projection이다.**

---

## Week 3 — Banach Fixed Point / Iteration

### 핵심 질문

> 반복법은 왜 수렴하는가?

### 내가 해결해야 할 문제

많은 SciML/수치 알고리즘은 해를 직접 구하지 않고 반복한다.

예:

- fixed-point solver
    
- Picard iteration
    
- implicit solver
    
- optimization loop
    
- implicit layer
    

### 질문 이해를 위한 기본 자료

- Kreyszig:
    
    - contraction mapping
        
    - fixed point
        
    - complete metric space
        
- Teschl:
    
    - Picard iteration과 ODE 존재·유일성 연결
        

### 답변을 위한 자료

- Banach fixed point theorem
    
- contraction condition
    
- iterative convergence
    

### 내 답변 목표

```text
반복법은 단순히 많이 반복한다고 수렴하는 것이 아니다.
반복 mapping이 complete space 위에서 contraction일 때,
고정점의 존재·유일성과 반복 수렴을 보장할 수 있다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Kreyszig/ch3_fixed_point.lean
```

남길 정의:

- `FixedPoint`
    
- `Contraction`
    
- `Iteration`
    
- `ConvergesToFixedPoint`
    

정리 statement:

- contraction mapping은 unique fixed point를 가진다.
    
- 반복열은 fixed point로 수렴한다.
    

Proof skeleton:

- Banach fixed point theorem
    

### Julia 실험

비교:

```julia
x_{n+1} = cos(x_n)
x_{n+1} = 2x_n
```

관찰:

- 첫 번째는 fixed point로 수렴
    
- 두 번째는 발산
    
- 같은 “반복”이라도 mapping의 성질이 결과를 결정
    

### SciML 매핑

- Picard iteration
    
- ODE solver
    
- implicit layer
    
- optimization stability
    

### 확장 키워드

- non-expansive mapping
    
- contraction constant
    
- fixed point neural networks
    
- implicit layers
    
- Deep Equilibrium Models
    

### 이번 주의 한 문장

> **반복법의 수렴은 계산 횟수가 아니라 mapping의 구조에 달려 있다.**

---

## Week 4 — ODE Existence / Uniqueness / Flow

### 핵심 질문

> ODE dynamics는 언제 하나의 flow로 잘 정의되는가?

### 내가 해결해야 할 문제

Neural ODE, EPD, sensitivity analysis, parameter inference는 모두 ODE가 상태를 시간에 따라 잘 정의된 방식으로 이동시킨다는 전제를 둔다.

### 질문 이해를 위한 기본 자료

- Teschl:
    
    - existence
        
    - uniqueness
        
    - initial value problem
        
    - dependence on initial conditions
        
- MIT 18.03SC:
    
    - ODE 모델링과 해석 기본
        

### 답변을 위한 자료

- Picard–Lindelöf theorem
    
- Lipschitz condition
    
- Grönwall inequality
    
- flow map
    

### 내 답변 목표

```text
ODE solution은 단순 공식이 아니라,
초기조건을 시간에 따라 이동시키는 flow다.
Lipschitz 조건과 존재·유일성 정리는 이 flow가 잘 정의되기 위한 조건이다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Teschl/ch4_ode_flow.lean
```

남길 정의:

- `ODE`
    
- `Solution`
    
- `LipschitzContinuous`
    
- `IntegralEquation`
    
- `FlowMap`
    
- `ParameterDependentODE`
    

정리 statement:

- Picard–Lindelöf theorem statement
    
- Grönwall inequality statement
    
- solution depends continuously on initial condition
    

Proof skeleton:

- Picard iteration이 contraction이 되는 흐름
    

### Julia 실험

Toy problem:

```julia
u' = r*u*(1 - u/K)
```

확인:

- `r` 변화에 따른 trajectory 변화
    
- 초기조건 변화에 따른 trajectory 변화
    
- solver tolerance 변화에 따른 numerical solution 변화
    

### SciML 매핑

- Neural ODE
    
- parameter inference
    
- sensitivity analysis
    
- EPD
    
- flow matching
    

### 확장 키워드

- sensitivity equation
    
- adjoint sensitivity
    
- stiffness
    
- continuous dependence
    
- flow map learning
    

### 이번 주의 한 문장

> **ODE solution은 공식이 아니라 well-defined flow다.**

---

## Week 5 — Numerical Error / Solver Stability

### 핵심 질문

> 수학적 해와 solver가 계산한 해는 어떻게 다른가?

### 내가 해결해야 할 문제

ODE의 해가 존재해도, 컴퓨터가 계산한 trajectory는 근사값이다.  
SciML에서 solver를 쓰면 model error, solver error, data error를 구분해야 한다.

### 질문 이해를 위한 기본 자료

- MIT 18.330 Introduction to Numerical Analysis
    
- DifferentialEquations.jl Getting Started
    

### 답변을 위한 자료

- Euler method
    
- RK method
    
- local/global truncation error
    
- stability
    
- stiffness
    

### 내 답변 목표

```text
수학적 해와 numerical solver output은 다르다.
Solver는 연속 문제를 이산 문제로 바꾸며,
step size, stability, stiffness에 따라 결과가 달라진다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Numerics/ch5_error_stability.lean
```

남길 정의:

- `TimeStep`
    
- `DiscreteTrajectory`
    
- `LocalTruncationError`
    
- `GlobalError`
    
- `StableScheme`
    
- `ConsistentScheme`
    

정리 statement:

- consistency + stability → convergence 구조 statement
    
- Euler method local truncation error statement
    

Proof skeleton:

- local error가 global error로 누적되는 구조
    

### Julia 실험

Toy problems:

```julia
u' = -λu
u' = r*u*(1-u/K)
```

비교:

- Euler
    
- RK4
    
- adaptive solver
    

관찰:

- step size가 크면 Euler가 불안정해진다.
    
- RK4도 step size에 의존한다.
    
- stiff problem에서는 naive solver가 실패할 수 있다.
    

### SciML 매핑

- Neural ODE
    
- differentiable solver
    
- adjoint sensitivity
    
- solver-based inverse problem
    
- physics-informed loss에서 derivative approximation
    

### 확장 키워드

- A-stability
    
- stiff solver
    
- adaptive time stepping
    
- numerical conditioning
    
- solver tolerance
    

### 이번 주의 한 문장

> **Solver output은 참해가 아니라 통제된 근사값이다.**

---

## Week 6 — PDE / Conservation / Boundary Condition

### 핵심 질문

> PDE는 어떤 물리 구조와 경계 조건을 표현하는가?

### 내가 해결해야 할 문제

PDE는 단순히 변수가 많은 ODE가 아니라, 공간 구조, 흐름, 보존 법칙, 경계 조건을 표현하는 언어다.

### 질문 이해를 위한 기본 자료

- Evans:
    
    - 대표 PDE
        
    - elliptic / parabolic / hyperbolic
        
    - boundary condition
        
- MIT 18.03SC:
    
    - 미분방정식 모델링 감각 보강
        

### 답변을 위한 자료

- heat equation
    
- wave equation
    
- Laplace / Poisson equation
    
- conservation law
    
- continuity equation
    

### 내 답변 목표

```text
PDE는 공간과 시간에 걸친 구조적 제약이다.
Boundary condition과 initial condition은 해 공간을 제한하며,
conservation law는 물리적으로 가능한 변화를 규정한다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Evans/ch6_pde_big_picture.lean
```

남길 정의:

- `PDE`
    
- `EllipticEquation`
    
- `ParabolicEquation`
    
- `HyperbolicEquation`
    
- `BoundaryCondition`
    
- `InitialCondition`
    
- `ConservationLaw`
    

정리 statement:

- conservation law의 integral balance statement
    
- boundary condition이 solution space를 제한한다는 statement
    

Proof skeleton:

- continuity equation이 conservation law에서 나오는 흐름
    

### Julia 실험

Toy problem:

```julia
u_t = α*u_xx
```

관찰:

- heat equation은 sharp feature를 smoothing한다.
    
- boundary condition에 따라 solution이 달라진다.
    
- grid가 coarse하면 세부 구조가 사라진다.
    

### SciML 매핑

- PINN
    
- FNO
    
- Neural Operator
    
- conservation-preserving model
    
- physics-informed loss
    

### 확장 키워드

- weak solution
    
- boundary value problem
    
- conservation law
    
- continuity equation
    
- finite difference
    
- finite volume
    

### 이번 주의 한 문장

> **PDE는 물리 제약과 공간 구조를 표현하는 언어다.**

---

## Week 7 — Weak Derivative / Weak Form / Test Function

### 핵심 질문

> noisy data에서 직접 미분하지 않고 방정식 정보를 쓸 수 있는가?

### 내가 해결해야 할 문제

현실 데이터는 noisy하고 sparse하다.  
Strong form은 데이터를 직접 미분하려고 하므로 불안정할 수 있다.

### 질문 이해를 위한 기본 자료

- Evans:
    
    - weak derivative
        
    - Sobolev space
        
    - weak solution
        
- Brenner & Scott:
    
    - Sobolev basics
        
    - variational formulation의 배경
        

### 답변을 위한 자료

- integration by parts
    
- test function
    
- weak derivative
    
- weak residual
    
- noisy numerical differentiation
    

### 내 답변 목표

```text
Weak form은 데이터를 직접 미분하지 않고,
미분을 test function 쪽으로 옮겨 적분 형태로 방정식 정보를 사용하는 방식이다.
따라서 noisy data에서 strong form보다 안정적인 residual을 구성할 수 있다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Evans/ch7_weak_form.lean
```

남길 정의:

- `TestFunction`
    
- `WeakDerivative`
    
- `SobolevSpace`
    
- `SobolevNorm`
    
- `WeakResidual`
    

정리 statement:

- smooth derivative는 weak derivative와 일치한다.
    
- weak derivative uniqueness statement
    
- integration by parts 기반 weak formulation statement
    

Proof skeleton:

- weak derivative 정의가 integration by parts에서 나오는 흐름
    

### Julia 실험

Toy problem:

```julia
u(t) = sin(t)
u_noisy(t) = sin(t) + noise
```

비교:

- finite difference derivative
    
- weak residual using test function
    

관찰:

- finite difference는 noise를 크게 증폭한다.
    
- weak residual은 적분 때문에 noise 민감도가 완화된다.
    
- test function width가 결과에 영향을 준다.
    

### SciML 매핑

- Weak SINDy
    
- WENDy
    
- weak-form regression
    
- variational PINN
    
- weak PDE discovery
    

### 확장 키워드

- WSINDy
    
- compact support test function
    
- convolution view of weak form
    
- residual covariance
    
- errors-in-variables
    
- IRLS
    

### 이번 주의 한 문장

> **Weak form은 noisy data에서 직접 미분을 피하는 장치다.**

---

## Week 8 — Variational Form / Lax–Milgram

### 핵심 질문

> PDE를 함수공간 위의 안정적인 variational problem으로 볼 수 있는가?

### 내가 해결해야 할 문제

PDE를 pointwise equation으로만 보면 미분 가능성, boundary, noise, 약해 문제가 복잡해진다.  
Variational form은 PDE를 함수공간 위의 문제로 다시 쓴다.

### 질문 이해를 위한 기본 자료

- Evans:
    
    - weak solution
        
    - energy method
        
    - Lax–Milgram
        
- Brenner & Scott:
    
    - variational formulation
        
    - bilinear form
        
    - coercivity
        
    - continuity
        

### 답변을 위한 자료

- bilinear form
    
- coercivity
    
- continuity
    
- linear functional
    
- weak solution
    
- energy minimization
    

### 내 답변 목표

```text
Lax–Milgram은 단순한 PDE 정리가 아니라,
weak problem이 존재·유일·안정적인 해를 갖기 위한 구조적 조건이다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Evans/ch8_lax_milgram.lean
```

남길 정의:

- `BilinearForm`
    
- `Coercive`
    
- `ContinuousBilinearForm`
    
- `LinearFunctional`
    
- `WeakSolution`
    
- `EnergyFunctional`
    

정리 statement:

- Lax–Milgram theorem statement
    
- weak solution과 energy minimizer의 동치 statement
    
- coercivity가 stability를 준다는 statement
    

Proof skeleton:

- Riesz representation을 이용한 Lax–Milgram 증명 흐름
    

### Julia 실험

Toy problem:

```julia
-u'' = f,  u(0)=u(1)=0
```

확인:

- residual minimization 관점
    
- energy minimization 관점
    
- boundary condition 위반 시 문제 발생
    

### SciML 매핑

- Deep Ritz
    
- variational PINN
    
- weak-form neural method
    
- energy-based PDE solver
    

### 확장 키워드

- coercivity
    
- energy norm
    
- Ritz method
    
- Deep Ritz
    
- variational inequality
    
- weak boundary condition
    

### 이번 주의 한 문장

> **Lax–Milgram은 weak problem의 존재·유일·안정성을 보장하는 기준이다.**

---

## Week 9 — Galerkin / Céa Lemma / Approximation

### 핵심 질문

> 무한차원 문제를 유한차원으로 줄여도 되는 근거는 무엇인가?

### 내가 해결해야 할 문제

컴퓨터는 무한차원 함수공간을 직접 다룰 수 없다.  
따라서 finite-dimensional subspace 또는 neural network function class로 제한한다.

### 질문 이해를 위한 기본 자료

- Brenner & Scott:
    
    - Galerkin
        
    - finite element method
        
    - Céa lemma
        
- MIT 18.330:
    
    - approximation
        
    - interpolation
        
    - numerical methods 기본
        

### 답변을 위한 자료

- finite-dimensional subspace
    
- Galerkin approximation
    
- Galerkin orthogonality
    
- best approximation error
    
- Céa lemma
    

### 내 답변 목표

```text
Galerkin은 무한차원 문제를 유한차원 부분공간으로 제한하는 원리다.
Céa lemma는 Galerkin 해의 오차가 best approximation error에 의해 제어됨을 말한다.
```

### Lean 4 기록

작업 파일:

```text
SciML/BrennerScott/ch9_galerkin_cea.lean
```

남길 정의:

- `FiniteDimensionalSubspace`
    
- `GalerkinApproximation`
    
- `GalerkinOrthogonality`
    
- `BestApproximationError`
    
- `ErrorBound`
    

정리 statement:

- Galerkin orthogonality
    
- Céa lemma statement
    
- error ≤ constant × best approximation error
    

Proof skeleton:

- Céa lemma 부등식 유도
    

### Julia 실험

Toy problem:

```julia
-u'' = f,  u(0)=u(1)=0
```

비교:

- basis 개수 2개
    
- basis 개수 5개
    
- basis 개수 10개
    

관찰:

- approximation space가 커지면 clean setting에서는 error가 감소한다.
    
- noisy setting에서는 차원이 커질수록 불안정해질 수 있다.
    
- discretization 자체가 regularization 역할을 할 수 있다.
    

### SciML 매핑

- Deep Ritz
    
- neural network trial space
    
- Neural Operator resolution issue
    
- spectral truncation
    
- discretization as regularization
    

### 확장 키워드

- finite element method
    
- basis function
    
- trial space
    
- approximation theory
    
- spectral method
    
- neural tangent kernel
    

### 이번 주의 한 문장

> **Galerkin은 무한차원 문제를 통제 가능한 유한차원 문제로 내리는 원리다.**

---

## Week 10 — Inverse Problem / Ill-posedness / Identifiability

### 핵심 질문

> 데이터로부터 무엇을 안정적으로 복원할 수 있는가?

### 내가 해결해야 할 문제

많은 SciML 문제는 forward problem이 아니라 inverse problem이다.

예:

- parameter inference
    
- equation discovery
    
- hidden state reconstruction
    
- snapshot data에서 dynamics 추정
    

### 질문 이해를 위한 기본 자료

- Kirsch:
    
    - well-posedness
        
    - ill-posedness
        
    - inverse problem의 기본 구조
        
- MIT 18.05:
    
    - uncertainty
        
    - inference
        
    - regression
        

### 답변을 위한 자료

- Hadamard well-posedness
    
- continuous dependence
    
- compact operator
    
- identifiability
    
- noise amplification
    

### 내 답변 목표

```text
Inverse problem에서는 답이 존재하는지, 유일한지,
데이터 perturbation에 안정적인지가 먼저다.
성능이 좋아 보여도 identifiability가 없으면
해석 가능한 복원이라고 보기 어렵다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Kirsch/ch10_inverse_problem.lean
```

남길 정의:

- `ForwardOperator`
    
- `InverseProblem`
    
- `WellPosed`
    
- `IllPosed`
    
- `ContinuousDependence`
    
- `Identifiable`
    

정리 statement:

- Hadamard well-posedness statement
    
- continuous dependence가 stability라는 statement
    
- compact operator inverse instability statement
    

Proof skeleton:

- compact operator의 inverse가 noise를 증폭시키는 흐름
    

### Julia 실험

Toy problem:

```julia
g(x) = ∫₀ˣ f(s) ds
```

실험:

- `f`를 적분해서 `g` 생성
    
- `g`에 작은 noise 추가
    
- numerical differentiation으로 `f` 복원
    

관찰:

- `g`의 작은 noise가 `f` 복원에서 크게 증폭된다.
    
- inverse operation은 forward operation보다 불안정하다.
    

### SciML 매핑

- SINDy
    
- WENDy
    
- EPD
    
- inverse PINN
    
- parameter inference
    
- system identification
    

### 확장 키워드

- structural identifiability
    
- practical identifiability
    
- Fisher information
    
- posterior uncertainty
    
- errors-in-variables
    
- inverse crime
    

### 이번 주의 한 문장

> **Inverse problem에서는 정확도보다 안정성과 식별성이 먼저다.**

---

## Week 11 — Regularization / Tikhonov / Spectral Filtering

### 핵심 질문

> ill-posed inverse problem에서 어떤 정보를 버리고 어떤 정보를 남길 것인가?

### 내가 해결해야 할 문제

불안정한 inverse problem에서 모든 정보를 복원하려고 하면 noise까지 복원한다.  
Regularization은 해를 안정화하기 위한 정보 필터링이다.

### 질문 이해를 위한 기본 자료

- Kirsch:
    
    - Tikhonov
        
    - regularization
        
    - spectral filtering
        
    - discretization as regularization
        
- MIT 18.06:
    
    - SVD
        
    - eigenvalue
        
    - least squares
        

### 답변을 위한 자료

- Tikhonov functional
    
- normal equation
    
- SVD
    
- singular value decay
    
- truncated SVD
    
- spectral filtering
    
- regularization parameter
    

### 내 답변 목표

```text
Regularization은 단순한 overfitting 방지가 아니다.
Ill-posed inverse problem에서 작은 singular value 방향의 noise 증폭을 억제하기 위해,
일부 정보를 의도적으로 버리는 안정화 구조다.
```

### Lean 4 기록

작업 파일:

```text
SciML/Kirsch/ch11_regularization.lean
```

남길 정의:

- `TikhonovFunctional`
    
- `RegularizationParameter`
    
- `AdjointOperator`
    
- `NormalEquation`
    
- `SpectralFilter`
    
- `DiscretizationScheme`
    

정리 statement:

- Tikhonov minimizer의 normal equation statement
    
- 작은 singular value 방향에서 noise가 증폭된다는 statement
    
- projection/discretization이 regularization 역할을 할 수 있다는 statement
    

Proof skeleton:

- Tikhonov 목적함수의 first variation이 normal equation으로 이어지는 흐름
    

### Julia 실험

Toy problem:

```text
ill-conditioned matrix A
true vector x
noisy observation b = Ax + noise
```

비교:

1. naive least squares
    
2. truncated SVD
    
3. Tikhonov regularization
    

관찰:

- 작은 singular value 방향에서 noise가 증폭된다.
    
- truncated SVD는 작은 singular value 방향을 버린다.
    
- Tikhonov는 그 방향을 부드럽게 억제한다.
    
- regularization parameter가 너무 크면 bias가 증가한다.
    

### SciML 매핑

- WENDy covariance weighting
    
- SINDy sparse regression
    
- PINN loss balancing
    
- Neural Operator spectral truncation
    
- noisy inverse problem
    

### 확장 키워드

- ridge regression
    
- LASSO
    
- Bayesian prior
    
- covariance weighting
    
- Morozov discrepancy principle
    
- Landweber iteration
    

### 이번 주의 한 문장

> **Regularization은 noise 증폭을 제어하기 위한 정보 필터링이다.**

---

## Week 12 — SciML Mapping / Method Comparison

### 핵심 질문

> SciML 방법론은 앞의 이론 중 무엇을 사용하고 있는가?

### 내가 해결해야 할 문제

마지막 주의 목표는 최신 논문을 많이 읽는 것이 아니다.  
앞의 11주 동안 만든 이론 지도를 사용해 SciML 방법론 2개를 정확히 해석하는 것이다.

### 질문 이해를 위한 기본 자료

둘만 선택한다.

추천 조합:

```text
Weak SINDy/WENDy + Deep Ritz
```

또는:

```text
PINN + Weak SINDy/WENDy
```

### 답변을 위한 자료

- Deep Ritz
    
- SINDy
    
- WENDy
    
- FNO
    
- Spectral bias
    

### 분석 기준

각 방법론을 아래 질문으로 분석한다.

```text
1. forward problem인가 inverse problem인가?
2. strong form을 쓰는가 weak form을 쓰는가?
3. loss는 어떤 norm/residual인가?
4. 해 공간을 어떻게 제한하는가?
5. boundary/initial condition은 어떻게 강제하는가?
6. noise와 uncertainty를 어떻게 다루는가?
7. solver를 쓰는가, solver-free인가?
8. 안정성 또는 수렴성 주장은 어디까지 가능한가?
```

### Lean 4 기록

작업 파일:

```text
SciML/SciML_Mapping.lean
```

남길 정의:

- `PhysicsInformedLoss`
    
- `WeakFormResidual`
    
- `VariationalLoss`
    
- `EquationDiscoveryProblem`
    
- `RegularizedInverseProblem`
    
- `NeuralTrialSpace`
    

정리 statement:

- Deep Ritz는 energy minimization 문제로 볼 수 있다.
    
- Weak SINDy/WENDy는 weak residual 기반 inverse problem으로 볼 수 있다.
    
- PINN은 strong residual minimization으로 볼 수 있다.
    
- FNO는 function space 사이의 operator approximation으로 볼 수 있다.
    

### Julia 실험

새 실험을 하지 않아도 된다.  
Week 7, Week 10, Week 11 실험을 재해석한다.

선택 실험:

- noisy logistic ODE에서 finite difference regression vs weak-form regression
    
- Poisson equation에서 strong residual vs energy minimization
    
- ill-conditioned inverse problem에서 least squares vs Tikhonov
    

### 최종 산출물

```markdown
# 내가 이해한 SciML의 이론 지도

## 1. Function space
해는 어디에 사는가?

## 2. Norm / Loss
오차는 무엇으로 재는가?

## 3. ODE / PDE
어떤 구조를 만족해야 하는가?

## 4. Weak form
직접 미분을 어떻게 피하는가?

## 5. Galerkin / Approximation
무한차원을 어떻게 유한차원으로 내리는가?

## 6. Inverse problem
데이터로 무엇을 복원하는가?

## 7. Regularization
불안정성을 어떻게 제어하는가?

## 8. SciML method
Neural network는 위 구조 중 무엇을 대신하고, 무엇을 보존하는가?
```

### 확장 키워드

- PINN convergence
    
- neural operator theory
    
- NTK
    
- spectral bias
    
- weak-form PDE learning
    
- Bayesian inverse problem
    
- uncertainty quantification
    

### 이번 주의 한 문장

> **SciML은 neural network 사용법이 아니라, 함수공간 문제를 학습 가능한 형태로 옮기는 시도다.**

---

## 8. LLM에게 요청할 때 사용할 프롬프트 템플릿

### 8.1 주차 시작용

```markdown
나는 SciML 이론-현실 연결형 커리큘럼의 Week N을 진행 중이다.

이번 주 핵심 질문은 다음이다.

> [핵심 질문]

내가 해결해야 할 문제는 다음이다.

> [문제 설명]

다음 조건에 맞게 도와줘.

1. 질문을 이해하기 위한 기본 개념을 정리해줘.
2. 읽어야 할 최소 자료 범위를 제안해줘.
3. 답변의 핵심 구조를 만들어줘.
4. Lean 4로 남길 def/class/theorem 후보를 제안해줘.
5. Julia로 확인할 작은 실험을 제안해줘.
6. SciML 방법론과 어떻게 연결되는지 정리해줘.
7. 확장 키워드는 지금 읽지 않고 목록만 만들어줘.
```

---

### 8.2 논문/교재 읽기 보조용

```markdown
아래 자료를 Week N의 핵심 질문에 답하기 위한 관점에서 읽고 싶다.

핵심 질문:
> [질문]

자료:
> [논문/교재/섹션]

다음 형식으로 정리해줘.

1. 이 자료에서 이번 질문과 직접 관련 있는 부분
2. 지금은 건너뛰어도 되는 부분
3. 반드시 이해해야 하는 정의
4. 반드시 이해해야 하는 정리 또는 주장
5. SciML 연결
6. Lean 4로 남길 구조
7. Julia 실험으로 확인할 수 있는 현실 연결
```

---

### 8.3 Lean 4 보조용

```markdown
다음 수학 개념을 Lean 4로 구조화하고 싶다.

주제:
> [주제]

핵심 질문:
> [질문]

내 목적은 완전 증명이 아니라 구조화다.
따라서 theorem은 by sorry로 두어도 된다.

다음 형식으로 제안해줘.

1. 필요한 class
2. 필요한 def
3. theorem statement 1~2개
4. proof skeleton 주석
5. 너무 어려워서 지금은 생략할 부분
```

---

### 8.4 Julia 실험 보조용

```markdown
다음 이론의 현실적 의미를 Julia로 작게 확인하고 싶다.

주제:
> [주제]

핵심 질문:
> [질문]

조건:
- 실험은 작아야 한다.
- 그림 1개 또는 수치 비교 1개면 충분하다.
- 성능 개선이 아니라 이론 확인이 목적이다.

다음 형식으로 제안해줘.

1. toy problem
2. 필요한 Julia 패키지
3. 실험 절차
4. 관찰해야 할 현상
5. 결과를 어떻게 해석해야 하는지
```

---

## 9. 최종 요약

이 커리큘럼의 핵심은 다음이다.

```text
질문을 먼저 정한다.
그 질문에 답하기 위해 자료를 읽는다.
답변을 자연어로 정리한다.
답변의 구조를 Lean 4로 남긴다.
답변의 현실적 의미를 Julia로 확인한다.
확장 키워드는 기록만 하고 당장 깊게 들어가지 않는다.
```

최종 결과물은 다음 네 가지다.

```text
1. 질문에 대한 답변 노트
2. Lean 4 구조화 파일
3. Julia 실험 노트북
4. SciML 이론 지도
```

이 커리큘럼의 한 문장 요약은 다음과 같다.

> **SciML을 배우는 것이 아니라, SciML이 왜 그런 형태를 가져야 하는지 질문하고, 그 답을 이론·코드·실험으로 남기는 커리큘럼이다.**