<!--
LLM 참고 지표:
- 이 문서는 Week 5의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
