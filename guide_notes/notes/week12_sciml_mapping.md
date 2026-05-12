<!--
LLM 참고 지표:
- 이 문서는 Week 12의 상세 학습 노트입니다.
- 전체 커리큘럼 흐름은 ../CURRICULUM.md를 참고하세요.
- 공통 참고 자료는 ../RESOURCES.md를 참고하세요.
- 답변 방식과 Lean 4 / Julia의 역할은 ../LLM_CONTEXT.md를 참고하세요.
- 주차별 작성 템플릿은 ../WORKFLOW.md를 참고하세요.
-->

## Week 12 — SciML Mapping / Method Comparison

### 핵심 질문

> SciML 방법론은 앞의 이론 중 무엇을 사용하고 있는가?

### 내가 해결해야 할 문제

마지막 주의 목표는 최신 논문을 많이 읽는 것이 아니다.  
앞의 11주 동안 만든 이론 지도를 사용해 SciML 방법론 2개를 정확히 해석하는 것이다.

### 질문 이해를 위한 기본 자료

둘만 선택한다.

추천 조합:

```text
Weak SINDy/WENDy + Deep Ritz
```

또는:

```text
PINN + Weak SINDy/WENDy
```

### 답변을 위한 자료

- Deep Ritz
    
- SINDy
    
- WENDy
    
- FNO
    
- Spectral bias
    

### 분석 기준

각 방법론을 아래 질문으로 분석한다.

```text
1. forward problem인가 inverse problem인가?
2. strong form을 쓰는가 weak form을 쓰는가?
3. loss는 어떤 norm/residual인가?
4. 해 공간을 어떻게 제한하는가?
5. boundary/initial condition은 어떻게 강제하는가?
6. noise와 uncertainty를 어떻게 다루는가?
7. solver를 쓰는가, solver-free인가?
8. 안정성 또는 수렴성 주장은 어디까지 가능한가?
```

### Lean 4 기록

작업 파일:

```text
SciML/SciML_Mapping.lean
```

남길 정의:

- `PhysicsInformedLoss`
    
- `WeakFormResidual`
    
- `VariationalLoss`
    
- `EquationDiscoveryProblem`
    
- `RegularizedInverseProblem`
    
- `NeuralTrialSpace`
    

정리 statement:

- Deep Ritz는 energy minimization 문제로 볼 수 있다.
    
- Weak SINDy/WENDy는 weak residual 기반 inverse problem으로 볼 수 있다.
    
- PINN은 strong residual minimization으로 볼 수 있다.
    
- FNO는 function space 사이의 operator approximation으로 볼 수 있다.
    

### Julia 실험

새 실험을 하지 않아도 된다.  
Week 7, Week 10, Week 11 실험을 재해석한다.

선택 실험:

- noisy logistic ODE에서 finite difference regression vs weak-form regression
    
- Poisson equation에서 strong residual vs energy minimization
    
- ill-conditioned inverse problem에서 least squares vs Tikhonov
    

### 최종 산출물

```markdown
# 내가 이해한 SciML의 이론 지도

## 1. Function space
해는 어디에 사는가?

## 2. Norm / Loss
오차는 무엇으로 재는가?

## 3. ODE / PDE
어떤 구조를 만족해야 하는가?

## 4. Weak form
직접 미분을 어떻게 피하는가?

## 5. Galerkin / Approximation
무한차원을 어떻게 유한차원으로 내리는가?

## 6. Inverse problem
데이터로 무엇을 복원하는가?

## 7. Regularization
불안정성을 어떻게 제어하는가?

## 8. SciML method
Neural network는 위 구조 중 무엇을 대신하고, 무엇을 보존하는가?
```

### 확장 키워드

- PINN convergence
    
- neural operator theory
    
- NTK
    
- spectral bias
    
- weak-form PDE learning
    
- Bayesian inverse problem
    
- uncertainty quantification
    

### 이번 주의 한 문장

> **SciML은 neural network 사용법이 아니라, 함수공간 문제를 학습 가능한 형태로 옮기는 시도다.**

---
