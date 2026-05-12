<!--
LLM 참고 지표:
- 이 문서는 Week 9의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
