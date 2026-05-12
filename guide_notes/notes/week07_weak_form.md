<!--
LLM 참고 지표:
- 이 문서는 Week 7의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
