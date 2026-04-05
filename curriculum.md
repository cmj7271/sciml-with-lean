## 1.1 필요한 자료 목록(명확히)

### 코어(필수)

- **Evans — _Partial Differential Equations (2nd ed.)_**: Ch.5–6 중심. (책의 큰 구성/장 목록 확인) ([bookstore.ams.org](https://bookstore.ams.org/gsm-19-r/ "Partial Differential Equations: Second Edition"))
- **Teschl — _Ordinary Differential Equations and Dynamical Systems_**: Ch.2–3 + (가능하면) DS 파트. (AMS에 ToC 존재) ([bookstore.ams.org](https://bookstore.ams.org/gsm-140/?utm_source=chatgpt.com "Ordinary Differential Equations and Dynamical Systems"))
- **Kreyszig — _Introductory Functional Analysis with Applications_**: metric/normed/Hilbert + compact/spectral 요지. (Wiley/Google Books ToC 확인 가능) ([Wiley](https://www.wiley.com/en-ae/Introductory%2BFunctional%2BAnalysis%2Bwith%2BApplications-p-9780471504597?utm_source=chatgpt.com "Introductory Functional Analysis with Applications"))
- **Brenner & Scott — _The Mathematical Theory of Finite Element Methods_**: Sobolev–variational–Galerkin–Céa. (Springer ToC) ([Springer](https://link.springer.com/book/10.1007/978-0-387-75934-0 "The Mathematical Theory of Finite Element Methods | Springer Nature Link"))
- **Kirsch — _An Introduction to the Mathematical Theory of Inverse Problems (3rd ed.)_**: Ch.1–3(특히 discretization as regularization). (Springer ToC) ([Springer](https://link.springer.com/book/10.1007/978-3-030-63343-1 "An Introduction to the Mathematical Theory of Inverse Problems | Springer Nature Link"))

### 브릿지(이론적으로만 SciML 연결, **12주차에서 선택**)

- **E & Yu — “The Deep Ritz method”** (변분 문제를 NN으로) ([arXiv](https://arxiv.org/abs/1710.00211?utm_source=chatgpt.com "The Deep Ritz method: A deep learning-based numerical algorithm for solving variational problems"))
- **Shin–Darbon–Karniadakis — “On the convergence of PINNs …”** ([arXiv](https://arxiv.org/abs/2004.01806?utm_source=chatgpt.com "On the convergence of physics informed neural networks for linear second-order elliptic and parabolic type PDEs"))
- **Rahaman et al. — “On the Spectral Bias of Neural Networks”** ([Proceedings of Machine Learning Research](https://proceedings.mlr.press/v97/rahaman19a.html?utm_source=chatgpt.com "On the Spectral Bias of Neural Networks"))    
- **Jacot–Gabriel–Hongler — “Neural Tangent Kernel”** ([arXiv](https://arxiv.org/abs/1806.07572?utm_source=chatgpt.com "[1806.07572] Neural Tangent Kernel: Convergence and ..."))
- **Yarotsky / Gühring et al. — Sobolev norm 근사 경계(활성화 영향 포함)** ([arXiv](https://arxiv.org/abs/1610.01145?utm_source=chatgpt.com "Error bounds for approximations with deep ReLU networks"))

---

## 1.2 매주 산출물 (체크리스트 규격 고정)

매주 학습한 내용은 Lean 4 프로젝트 내의 코드로 직접 구현되며, 아래 4가지를 고정 산출물로 합니다. (자연어 메모 대신 `.lean` 파일 자체가 주간 산출물이 됩니다.)

- **정의 10개 (Lean `def` / `class`)**: 이번 주 핵심 정의를 Lean 4 문법에 맞춰 코드로 작성
- **정리 5개 (Lean `theorem`)**: 가정과 결론을 정확히 명시하여 정리 statement 작성 (증명은 `sorry` 처리)
- **Proof skeleton 1개 (Lean 주석)**: 핵심 정리 1개를 선택하여, `by` 블록 내부에 주석(`--`)으로 증명 흐름을 8~12줄 요약
- **SciML 매핑 1개 (주석 또는 블로그)**: “이번 주 내용이 SciML의 어떤 블록을 설명하는가?”를 5~10문장으로 정리하여 파일 하단이나 외부 기록장에 작성


**(선택)**
- **코드/실험**: 간단한 수치 실험/시각화(Python, Julia 등)로 개념 확인

## 1.3 Proof Assistant (Lean 4) 통합: 나만의 미니 수학 라이브러리 구축
Lean 4를 활용하여 교재의 내용을 단순히 읽는 것을 넘어, 책의 흐름을 따르는 **독자적인 미니 수학 라이브러리(Formalization)**를 직접 구축합니다. 이를 통해 수학적 구조를 프로그래밍 아키텍처로 변환하는 시야를 기릅니다.

### 왜 이 커리큘럼에 잘 맞나?
- 함수해석/변분/PDE의 복잡한 논리 전개를 `class`(공간의 구조), `def`(파생 개념), `theorem`(명제)으로 분리하는 훈련은, SciML 프레임워크에서 모델 아키텍처와 학습 로직을 설계하는 과정과 완벽히 대응됩니다.
- 컴파일러의 엄격한 타입 체크를 통해 "가정이 하나라도 빠지면 수식이 성립하지 않음"을 체감할 수 있습니다.

### 원칙 (The Golden Rules)
- **Do not prove from scratch**: 완벽한 증명 구현은 목표가 아닙니다. 모든 `theorem`의 증명은 `by sorry`로 넘겨 시간 대비 효율(ROI)을 보호합니다.
- **Outline via Comments**: 단, 주간 핵심 정리 1개는 `sorry`를 적기 전에 한글 주석(`-- 1. ...`, `-- 2. ...`)으로 논리적 증명 뼈대를 명확히 남깁니다.
- **Architectural Separation**: 구조(공리)는 `class`에, 참/거짓 명제는 `theorem`에 철저히 분리하여 작성합니다.

### 프로젝트 구조 및 준비
프로젝트는 아래의 디렉토리 구조를 따르며, 각 교재와 챕터별로 모듈화하여 관리합니다. AI 어시스턴트(Gemini CLI) 연동을 위한 프롬프트는 `GEMINI.md`에 보관합니다.


```
.
├── lake-manifest.json
├── lakefile.toml
├── lean-toolchain
├── README.md
├── GEMINI.md           # CLI 연동을 위한 시스템 프롬프트 및 가이드
├── SciML/              # 교재별 Lean 소스코드 디렉토리
│   ├── Basic.lean
│   ├── Evans/
│   │   └── ch1.lean
│   └── Kreyszig/
│       └── ch1.lean
└── SciML.lean          # 전체 라이브러리 루트
```

### 매주 루틴 (60~90분 타임박스)
1. **이번 주 교재 읽기**: 책을 읽으며 핵심 구조, 정의, 정리를 선별합니다.
2. **Lean 파일 생성**: 진도에 맞춰 `SciML/교재명/ch번호.lean` 파일을 생성합니다.
3. **네임스페이스 및 구조 선언**: 파일 최상단에 `namespace`를 열고, 공간의 기본 뼈대를 `class`로 정의합니다.
4. **정의/정리 코딩 (Statement Typer)**: 선별한 10개의 정의를 `def`로, 5개의 정리를 `theorem`으로 타이핑하여 타입 에러(빨간 줄)가 없도록 만듭니다.
5. **증명 뼈대 작성**: 가장 중요한 정리 1개의 `by` 블록 안에 수학적 논리 전개를 주석으로 달아둡니다.
6. **블로그/기록화**: 작성된 `.lean` 파일과 `GEMINI.md`를 활용하여(Gemini CLI 등) 이번 주 학습 내용을 블로그 포스팅 초안으로 변환합니다.
    

### 러닝 타임 보호 규칙 (중요)
- 문법 오류(타입 불일치 등)로 20분 이상 막히면, 해당 코드는 전체 주석 처리하거나 `sorry`로 강제 종료한 뒤 진도를 나갑니다.
- 증명을 돕는 Tactic(`intro`, `apply` 등) 사용에 집착하여 Rabbit hole에 빠지지 않도록 **증명은 무조건 `sorry`로 마감하는 것을 원칙**으로 합니다.
    

### 주간 산출물 템플릿 (Lean 코드 예시)
```
import Mathlib

namespace KreyszigCh1

-- 1. 구조 및 공리 (class)
class MetricSpace (α : Type) where
  dist : α → α → ℝ
  dist_self : ∀ x, dist x x = 0
  symm : ∀ x y, dist x y = dist y x
  triangle : ∀ x y z, dist x z ≤ dist x y + dist y z

variable {α : Type} [MetricSpace α]

-- 2. 정의 (def) : [개수 제한 없이 이번 주 핵심 정의 모두 나열]
def isCauchy (x : ℕ → α) : Prop := 
  ∀ ε > 0, ∃ N : ℕ, ∀ m n > N, dist (x m) (x n) < ε

def convergesTo (x : ℕ → α) (l : α) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n > N, dist (x n) l < ε


-- =========================================================
-- 3. 정리 (theorem) : (증명 없이 Statement 위주로 선언)
-- =========================================================

theorem uniqueness_of_limit (x : ℕ → α) (l1 l2 : α) (h1 : convergesTo x l1) (h2 : convergesTo x l2) : l1 = l2 := sorry

theorem closed_subset_of_complete_is_complete ... := sorry

theorem convergent_seq_is_bounded ... := sorry

theorem continuous_mapping_preserves_convergence ... := sorry


-- =========================================================
-- 4. Proof skeleton : 이번 주 핵심 정리 선정 (by 블록 활용)
-- =========================================================

theorem convergent_is_cauchy (x : ℕ → α) (l : α) (h : convergesTo x l) : isCauchy x := by
  -- [증명 흐름 요약]
  -- 1. 가정 h로부터 임의의 ε > 0 에 대해 거리가 ε/2 보다 작아지는 시점 N을 찾는다.
  -- 2. m, n > N 인 임의의 두 항 (x m)과 (x n)을 잡는다.
  -- 3. 삼각부등식을 적용한다: dist (x m) (x n) ≤ dist (x m) l + dist l (x n)
  -- 4. 거리의 대칭성을 이용해 dist l (x n) = dist (x n) l 로 바꾼다.
  -- 5. 두 거리 모두 ε/2 보다 작으므로 그 합은 ε 보다 작아진다. 따라서 코시 수열이다.
  sorry

end KreyszigCh1

/- 
[SciML 매핑]
여기서 다룬 완비성과 코시 수열의 개념은 SciML에서 신경망이 해를 탐색하는 
함수 공간(Function Space)의 수렴성을 보장하는 가장 기초적인 조건이 된다.
(이하 5~10문장 작성)
-/
```
---

# 2) 12주 플랜 (필수/선택이 분명한 형태)

## Week 1 — 함수해석 최소 언어: metric/normed → 완비성 → 연산자/함수열

**읽기(필수)**
- Kreyszig: Metric spaces, Normed spaces/Banach spaces(Ch.1–2 범위)

**체크**
- Cauchy/complete를 정확히 정의할 수 있다
- bounded linear operator/functional 정의 + 예시 3개

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Kreyszig/ch1_2.lean`
- **목표**: 거리공간 구조(`class MetricSpace`) 정의 및 코시/수렴 명제 선언
- **산출물**:
    - `def` 10개 (CauchySeq, BoundedOperator 등)
    - `theorem` 5개 (수렴수열은 코시수열이다 등, `by sorry` 처리)
    - **Proof skeleton 1개**: '수렴수열의 코시 성질' 또는 '완비공간의 닫힌 부분집합은 완비' 주석 작성

---

## Week 2 — Hilbert 공간과 투영: “무한차원 선형대수”의 시작

**읽기(필수)**
- Kreyszig: Inner product spaces, Hilbert spaces, Riesz representation(Ch.3–4)

**체크**
- Hilbert=완비 inner product space를 정확히 말할 수 있다
- orthogonal projection theorem/least squares를 말로 설명 가능

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Kreyszig/ch3_4.lean`
- **목표**: 내적공간 구조(`class InnerProductSpace`) 선언 및 힐베르트 공간의 직교 투영 명제화
- **산출물**:
    - `def` 10개 (InnerProduct, Orthogonal, RieszFunctional 등)
    - `theorem` 5개 (최소거리 투영 정리 등, `by sorry` 처리)
    - **Proof skeleton 1개**: Fréchet–Riesz 표현 정리 또는 직교 투영 정리 주석 작성

---

## Week 3 — 함수해석 3대 정리 + Banach fixed point(앵커 증명)

**읽기(필수)**
- Kreyszig: Hahn–Banach / Uniform boundedness / Open mapping & closed graph + Banach fixed point

**앵커(반드시 증명 흐름 작성)**
- Banach fixed point theorem proof skeleton (Lean 파일 내 주석으로 작성)

**체크**
- “완비 + 수축 → 존재/유일 + 반복수렴”을 말로 설명 가능

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Kreyszig/ch5.lean` (또는 고정점 관련 챕터)
- **목표**: 수축 사상(Contraction Mapping) 정의 및 고정점 정리의 타입 선언
- **산출물**:
    - `def` 10개 (Contraction, FixedPoint 등)
    - `theorem` 5개 (Banach Fixed Point 등, `by sorry` 처리)
    - **Proof skeleton 1개**: Banach fixed point 정리 논리 전개 주석 작성

---

## Week 4 — ODE를 ‘고정점/흐름’으로 보기

**읽기(필수)**
- Teschl: existence/uniqueness, Picard iteration, Grönwall(Ch.2–3)
    

**체크**
- Picard–Lindelöf 가정(Lipschitz)과 결론(국소 존재/유일)을 정확히 쓸 수 있다
- Banach fixed point와 연결해 설명 가능

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Teschl/ch2.lean`
- **목표**: Lipschitz 연속성 정의 및 ODE 해의 국소적 존재/유일성 명제화
- **산출물**:
    - `def` 10개 (LipschitzContinuous, IntegralEquation 등)
    - `theorem` 5개 (Picard-Lindelof 등, `by sorry` 처리)
    - **Proof skeleton 1개**: Picard Iteration이 수축 사상임을 보이는 주석 작성

---

## Week 5 — PDE 큰그림: 대표 방정식 4종 + “왜 Sobolev가 필요한가”

**읽기(필수)**
- Evans: Ch.2(대표 PDE들), Ch.5 서두(약해/에너지 관점의 필요성)

**체크**
- elliptic/parabolic/hyperbolic의 ‘대표 예시+물리 의미’ 1줄씩
- “고전해가 안 되면 약해”가 왜 자연스러운지 설명할 수 있음

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Evans/ch2.lean`
- **목표**: 고전적 미분의 한계 정의 및 쌍선형 형식(Bilinear form) 뼈대 선언
- **산출물**:
    - `def` 10개 (BilinearForm, Coercive, ContinuousForm 등)
    - `theorem` 5개 (쌍선형 형식의 기본 성질 등, `by sorry` 처리)
    - **Proof skeleton 1개**: 쌍선형 형식이 유계일 조건 주석 작성

---

## Week 6 — Sobolev 핵심 3종: 약미분/밀도/Trace (Trace를 필수로 격상)

**읽기(필수)**
- Brenner&Scott: Sobolev basics, trace, density (Ch.1–2 일부)
- Evans: Sobolev 공간 기본/약미분/밀도 (Ch.5 일부)

**체크**
- weak derivative 정의를 정확히 쓸 수 있다
- density(매끈함수로 근사)와 trace(경계값)의 필요성을 말로 설명 가능

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Evans/ch5.lean` (또는 BrennerScott)
- **목표**: 부분적분(Integration by parts)을 활용한 약미분(Weak Derivative)의 명제화
- **산출물**:
    - `def` 10개 (TestFunction, WeakDerivative, SobolevNorm 등)
    - `theorem` 5개 (약미분의 유일성 등, `by sorry` 처리)
    - **Proof skeleton 1개**: 연속함수로 약미분을 근사하는 밀도(Density) 개념 주석 작성

---

## Week 7 — Lax–Milgram(앵커) + 약형식: “PDE = 쌍선형형식 문제”

**읽기(필수)**
- Evans: weak form/energy method 연결(Ch.6 서두)
- Brenner&Scott: variational formulation의 틀(Ch.2)

**앵커(반드시 proof skeleton)**
- Lax–Milgram theorem proof skeleton 작성 (Lean 파일 내 주석)

**체크**
- coercive/continuous 조건이 왜 “해의 존재/유일 + 안정성”으로 이어지는지 말할 수 있음

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Evans/ch6.lean`
- **목표**: Lax-Milgram 정리의 엄밀한 가정(유계, 강제성)과 결론 명제화
- **산출물**:
    - `def` 10개 (WeakSolution, VariationalForm 등)
    - `theorem` 5개 (Lax-Milgram 정리, 에너지 최소화 동치 등, `by sorry` 처리)
    - **Proof skeleton 1개**: Riesz 표현 정리를 이용한 Lax-Milgram 증명 뼈대 주석 작성

---

## Week 8 — Galerkin과 Céa lemma(앵커): “이산화=부분공간 투영”

**읽기(필수)**
- Brenner&Scott: Galerkin, Céa lemma, best approximation(Ch.2–3 일부)    

**앵커**
- Céa lemma proof skeleton 작성 (Lean 파일 내 주석)

**체크**
- “오차 ≤ C × best approximation error”를 말로 설명

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/BrennerScott/ch2.lean`
- **목표**: 무한차원 공간을 유한차원 부분공간(`Submodule`)으로 투영하는 개념 코딩
- **산출물**:
    - `def` 10개 (GalerkinProjection, FiniteSubspace, ErrorBound 등)
    - `theorem` 5개 (Galerkin Orthogonality, Cea's Lemma 등, `by sorry` 처리)
    - **Proof skeleton 1개**: 직교성(Orthogonality)을 이용한 Céa Lemma 부등식 유도 주석 작성
        

---

## Week 9 — 역문제 입문: well-posed/ill-posed, 안정성 붕괴의 구조

**읽기(필수)**
- Kirsch: Chapter 1–2(ill-posedness, regularization의 필요)

**체크**
- Hadamard well-posedness 3조건(존재/유일/연속의존)을 정의로 말할 수 있다
- ill-posed 예시(미분 역연산/적분방정식)를 말로 설명

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Kirsch/ch1_2.lean`
- **목표**: Hadamard Well-posedness를 `class` 또는 연속 역연산자(`ContinuousInverse`)로 정의
- **산출물**:    
    - `def` 10개 (WellPosed, IllPosed, InverseOperator 등)
    - `theorem` 5개 (역연산자의 비연속성 예시 명제화 등, `by sorry` 처리)
    - **Proof skeleton 1개**: 컴팩트 연산자(Compact Operator)의 역연산자는 유계일 수 없음을 보이는 논리 주석 작성

---

## Week 10 — Tikhonov & 반복정칙화(랜드웨버): “필터링으로 보는 정칙화”

**읽기(필수)**
- Kirsch: Chapter 3(Tikhonov, spectral filtering, Landweber)

**체크**
- Tikhonov 정칙화 목적함수/정규방정식을 정확히 적을 수 있다
- “필터링 관점”을 말로 설명

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Kirsch/ch3.lean`
- **목표**: 수반 연산자(Adjoint, $A^\dagger$) 정의 및 정규방정식(Normal Equation) 뼈대 작성
- **산출물**:
    - `def` 10개 (AdjointOperator, TikhonovFunctional, RegularizationParameter 등)
    - `theorem` 5개 (Tikhonov 해의 존재성 등, `by sorry` 처리)
    - **Proof skeleton 1개**: Tikhonov 목적함수의 미분(변분)이 0이 되는 지점이 정규방정식임을 보이는 주석 작성

---

## Week 11 — Discretization as regularization: projection/Galerkin이 역문제에서 하는 역할

**읽기(필수)**
- Kirsch: Chapter 3 (Regularization by discretization: projection/Galerkin/collocation)    

**체크**
- “이산화 자체가 정칙화”라는 말을 수학적으로 설명 가능
- Week8의 Céa/투영 관점과 Week11의 정칙화 관점을 연결해서 말할 수 있음

**(권장) Lean 4 미니 라이브러리 구축 (30~60분)**
- **작업 파일**: `SciML/Kirsch/ch3_disc.lean`
- **목표**: 유한 차원으로의 투영 연산자가 일종의 정칙화 필터 역할을 함을 명제화
- **산출물**:
    - `def` 10개 (DiscretizationScheme, ProjectionFilter 등)
    - `theorem` 5개 (투영 차원 $N$에 따른 오차 수렴성 등, `by sorry` 처리)
    - **Proof skeleton 1개**: 직교 투영이 노이즈 증폭을 어떻게 억제하는지(Boundedness) 보여주는 주석 작성

---

## Week 12 — SciML 브릿지(이론만): 3개 모듈 중 2개 선택

마지막 주는 “현대 SciML 논문을 읽기 위한 이론 연결”만 합니다. 코딩은 선택.

### 모듈 A (추천) — 변분 기반 SciML: Deep Ritz
- 읽기: E & Yu, Deep Ritz method
- 체크: “변분 문제 최소화”가 Lax–Milgram/약형식과 어떻게 이어지는지 1페이지로 연결

### 모듈 B (추천) — PINN 수렴성의 한 예: Shin–Darbon–Karniadakis
- 읽기: Shin et al. 2020
- 체크: 이 논문에서 어떤 PDE 도구(최대원리/정칙성/컴팩트성 등)가 쓰이는지 ‘용어 매핑표’ 작성

### 모듈 C (선택) — 학습 동역학: spectral bias + NTK
- 읽기: Rahaman(스펙트럴 바이어스), Jacot(NTK)
- 체크: “PDE 해의 고주파 성분(특이/경계층)이 왜 학습에서 늦게 잡히나?”를 주파수 관점으로 서술

### (보너스) 모듈 D — Sobolev norm에서의 NN 근사(활성화/정칙성)
- 읽기: Yarotsky 또는 Gühring et al.
- 체크: “활성화가 Sobolev 근사에 어떤 흔적을 남기는가?”를 한 페이지 요약

**(권장) Lean 4 미니 라이브러리 통합 (30~60분)**
- **작업 파일**: `SciML/SciML_Mapping.lean`
- **목표**: 1~11주차에 작성한 내 라이브러리의 `def`, `theorem`들을 `import`하여 논문의 최종 수렴성 정리(Convergence Theorem) 명제 뼈대 조립하기.
    
- **산출물**:
    - 통합 `theorem` 3개 (PINN의 근사 한계, Deep Ritz의 변분 오차 등, `by sorry` 처리)
    - 논문 수식과 내 Lean 코드가 어떻게 연결되는지 파일 하단에 주석으로 기록.

---

# 3) 구현(선택) “Theory Verifier” 3개만 유지 (보고서 제안 중 정리해서 반영)

보고서의 프로젝트 제안은 방향이 좋아서, 다만 “프레임워크 의존/부담”을 줄이고 이론 검증만 남기도록 축약했습니다.

1. **Weak derivative verifier**: (u(x)=|x|) / (u(x)=\mathrm{Heaviside}(x))의 약도함수 감각
2. **Strong vs weak form 비교**: Poisson에서 잔차형 vs 변분형(Deep Ritz 스타일)
3. **Ill-posedness verifier**: 간단한 적분방정식/미분 역연산에서 노이즈 증폭 + Tikhonov 필터