<!--
LLM 참고 지표:
- 이 문서는 Week 11의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
