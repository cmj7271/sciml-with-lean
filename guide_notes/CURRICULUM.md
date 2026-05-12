# Curriculum

> 이 문서는 12주 커리큘럼의 전체 흐름을 보기 위한 문서입니다.  
> 각 주차의 상세 내용은 `notes/` 아래 문서를 참고하세요.

## 이 문서를 참고해야 하는 경우

- 현재 학습이 전체 흐름에서 어디에 있는지 확인할 때
- 특정 질문이 어느 주차에 해당하는지 찾을 때
- LLM이 사용자의 질문을 적절한 주차와 연결해야 할 때
- Week 1부터 Week 12까지의 개념 연결을 확인할 때

---

## 7. 12주 질문 중심 커리큘럼

---


## 주차별 상세 문서

- [Week 1 — Norm / Metric / Convergence](notes/week01_norm_metric.md)
- [Week 2 — Hilbert Space / Projection / Least Squares](notes/week02_projection_least_squares.md)
- [Week 3 — Banach Fixed Point / Iteration](notes/week03_fixed_point.md)
- [Week 4 — ODE Existence / Uniqueness / Flow](notes/week04_ode_flow.md)
- [Week 5 — Numerical Error / Solver Stability](notes/week05_solver_stability.md)
- [Week 6 — PDE / Conservation / Boundary Condition](notes/week06_pde_conservation.md)
- [Week 7 — Weak Derivative / Weak Form / Test Function](notes/week07_weak_form.md)
- [Week 8 — Variational Form / Lax–Milgram](notes/week08_variational_lax_milgram.md)
- [Week 9 — Galerkin / Céa Lemma / Approximation](notes/week09_galerkin_cea.md)
- [Week 10 — Inverse Problem / Ill-posedness / Identifiability](notes/week10_inverse_problem.md)
- [Week 11 — Regularization / Tikhonov / Spectral Filtering](notes/week11_regularization.md)
- [Week 12 — SciML Mapping / Method Comparison](notes/week12_sciml_mapping.md)

## 주차별 핵심 흐름 요약

| Week | 주제 | 중심 역할 |
|---|---|---|
| 1 | Norm / Metric / Convergence | loss, error, residual을 말하기 위한 언어 |
| 2 | Hilbert Space / Projection / Least Squares | noisy data에서 best approximation을 고르는 원리 |
| 3 | Banach Fixed Point / Iteration | 반복법 수렴의 구조적 조건 |
| 4 | ODE Existence / Uniqueness / Flow | dynamics가 well-defined flow가 되는 조건 |
| 5 | Numerical Error / Solver Stability | solver output과 참해의 차이 |
| 6 | PDE / Conservation / Boundary Condition | 공간 구조, 보존 법칙, 경계 조건 |
| 7 | Weak Derivative / Weak Form / Test Function | noisy data에서 직접 미분을 피하는 장치 |
| 8 | Variational Form / Lax–Milgram | weak problem의 존재·유일·안정성 |
| 9 | Galerkin / Céa Lemma / Approximation | 무한차원을 유한차원으로 내리는 근거 |
| 10 | Inverse Problem / Ill-posedness / Identifiability | 데이터로 무엇을 안정적으로 복원할 수 있는가 |
| 11 | Regularization / Tikhonov / Spectral Filtering | ill-posedness에서 정보 필터링으로 안정화 |
| 12 | SciML Mapping / Method Comparison | 앞의 이론이 SciML 방법론에 어떻게 쓰이는가 |
