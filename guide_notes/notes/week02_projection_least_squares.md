<!--
LLM 참고 지표:
- 이 문서는 Week 2의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
