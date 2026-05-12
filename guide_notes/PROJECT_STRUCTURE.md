# Project Structure

> 이 문서는 파일과 폴더의 역할을 설명합니다.  
> 원문에 있던 프로젝트 구조 권장안을 보존하고, 현재 분리된 문서 구조도 함께 안내합니다.

## 이 문서를 참고해야 하는 경우

- 저장소의 파일 배치를 정할 때
- Lean 4 파일, Julia 노트북, Markdown 노트를 어디에 둘지 정할 때
- LLM이 파일 구조를 이해하고 경로를 추천해야 할 때

## 현재 분리된 문서 구조

```text
.
├── README.md
├── REFERENCE_INDEX.md
├── LLM_CONTEXT.md
├── CURRICULUM.md
├── WORKFLOW.md
├── RESOURCES.md
├── PROMPTS.md
├── PROJECT_STRUCTURE.md
├── FINAL_SUMMARY.md
├── notes/
│   ├── week01_norm_metric.md
│   ├── week02_projection_least_squares.md
│   ├── week03_fixed_point.md
│   ├── week04_ode_flow.md
│   ├── week05_solver_stability.md
│   ├── week06_pde_conservation.md
│   ├── week07_weak_form.md
│   ├── week08_variational_lax_milgram.md
│   ├── week09_galerkin_cea.md
│   ├── week10_inverse_problem.md
│   ├── week11_regularization.md
│   └── week12_sciml_mapping.md
└── archive/
    └── ORIGINAL_FULL.md
```

---

## 6. 프로젝트 구조 권장안

```text
.
├── README.md
├── LLM_CONTEXT.md
├── CURRICULUM.md
├── GEMINI.md
├── notes/
│   ├── week01_norm_metric.md
│   ├── week02_projection_least_squares.md
│   └── ...
├── notebooks/
│   ├── week01_norm_comparison.jl
│   ├── week02_least_squares_projection.jl
│   └── ...
├── SciML/
│   ├── Basic.lean
│   ├── Kreyszig/
│   │   ├── ch1_norm_metric.lean
│   │   ├── ch2_hilbert_projection.lean
│   │   └── ch3_fixed_point.lean
│   ├── Teschl/
│   │   └── ch4_ode_flow.lean
│   ├── Numerics/
│   │   └── ch5_error_stability.lean
│   ├── Evans/
│   │   ├── ch6_pde_big_picture.lean
│   │   ├── ch7_weak_form.lean
│   │   └── ch8_lax_milgram.lean
│   ├── BrennerScott/
│   │   └── ch9_galerkin_cea.lean
│   ├── Kirsch/
│   │   ├── ch10_inverse_problem.lean
│   │   └── ch11_regularization.lean
│   └── SciML_Mapping.lean
└── SciML.lean
```

---

