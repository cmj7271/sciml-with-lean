<!--
LLM 참고 지표:
- 이 문서는 Week 6의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
