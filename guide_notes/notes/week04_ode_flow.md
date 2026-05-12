<!--
LLM 참고 지표:
- 이 문서는 Week 4의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
