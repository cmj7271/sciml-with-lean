<!--
LLM 참고 지표:
- 이 문서는 Week 8의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
