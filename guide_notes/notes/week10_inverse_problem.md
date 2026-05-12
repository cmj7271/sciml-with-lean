<!--
LLM 참고 지표:
- 이 문서는 Week 10의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
