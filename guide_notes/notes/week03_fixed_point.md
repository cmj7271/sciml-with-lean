<!--
LLM 참고 지표:
- 이 문서는 Week 3의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

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
