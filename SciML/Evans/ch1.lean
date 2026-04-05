import Mathlib

namespace KreyszigCh1

-- 1. 구조 및 공리 (class)
class MetricSpace (α : Type) where
  dist : α → α → ℝ
  dist_self : ∀ x y, dist x y = 0 ↔ x = y
  dist_symmentry : ∀ x y, dist x y = dist y x
  triangle_inequality : ∀ x y z, dist x z ≤ dist x y + dist y z
-- dist ≥ 0 임은 삼각부등식에 z <- x 를 통해서 확인가능하다

variable {α : Type} [MetricSpace α]

-- 2. 정의 (def)
-- == Nighborhood ==
def OpenBall (x_0 : α) (r : ℝ) : Set α :=
  { x : α | MetricSpace.dist x_0 x < r }

def IsOpen (s : Set α) : Prop :=
  ∀ x ∈ s, ∃ ε > 0, OpenBall x ε ⊆ s

def IsClosed (s : Set α) : Prop :=
  IsOpen sᶜ

def ConvergesTo (a : ℕ → α) (l : α) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n > N, MetricSpace.dist (a n) l < ε

def IsCauchy (a : ℕ → α) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n m, n > N → m > N → MetricSpace.dist (a n) (a m) < ε

class CompleteMetricSpace (α : Type) extends MetricSpace α where
  complete : ∀ (a : ℕ → α), IsCauchy a → ∃ l : α, ConvergesTo a l

def Accumulation (M : Set α) (x : α) : Prop :=
  ∀ ε > 0, ∃ y ∈ M, x ≠ y ∧ MetricSpace.dist x y < ε

def Closure (M : Set α) : Set α :=
  { x | x ∈ M ∨ Accumulation M x }

def IsDense (M : Set α) : Prop :=
  -- Closure M = α
  Closure M = Set.univ

def IsBounded (M : Set α) : Prop :=
  ∃ r : ℝ, ∀ x ∈ M, ∀ y ∈ M, MetricSpace.dist x y ≤ r

def IsBoundedSeq (a : ℕ → α) : Prop :=
  ∃ r : ℝ, ∀ n m, MetricSpace.dist (a n) (a m) ≤ r

def IsContinuousAt {β : Type} [MetricSpace β] (f : α → β) (x_0 : α) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x : α, MetricSpace.dist x_0 x < δ → MetricSpace.dist (f x) (f x_0) < ε

def IsContinuous /- with metric -/ {β : Type} [MetricSpace β] (f : α → β) : Prop :=
  ∀ x : α, IsContinuousAt f x

def IsContinuous_topo {β : Type} [MetricSpace β] (f : α → β) : Prop :=
  ∀ V : Set β, IsOpen V → IsOpen (f⁻¹' V)

def IsIsometry {β : Type} [MetricSpace β] (f : α → β) : Prop :=
  ∀ x y : α, MetricSpace.dist x y = MetricSpace.dist (f x) (f y)


-- =========================================================
-- 3. 정리 (theorem): (증명 없이 Statement 위주로 선언)
-- =========================================================

theorem continuous_iff_preimage_open {β : Type} [MetricSpace β] (f : α → β) :
  IsContinuous f ↔ ∀ Y : Set β, IsOpen Y → IsOpen { x : α | f x ∈ Y }
  := sorry

theorem continuous_metric_iff_topo {β : Type} [MetricSpace β] (f : α → β) :
  IsContinuous f ↔ IsContinuous_topo f := sorry

-- 수렴하는 수열은 코시 수열이다
theorem convergent_is_cauchy (a : ℕ → α) (l : α) (h : ConvergesTo a l) :
  IsCauchy a := sorry

-- 수렴하는 수열은 bound 하다
theorem convergent_is_bounded (a : ℕ → α) (l : α) (h : ConvergesTo a l) :
  IsBoundedSeq a := sorry

-- =========================================================
-- 4. Proof skeleton : 이번 주 핵심 정리 1개 선정 (by 블록 활용)
-- =========================================================

theorem dist_nonneg (x y : α) : 0 ≤ MetricSpace.dist x y := by
  -- 1. 삼각부등식 triangle_inequality 에서 z 자리에 x를 대입한다. (dist x x ≤ dist x y + dist y x)
  -- 2. dist_self 공리를 이용해 dist x x = 0 임을 적용한다.
  -- 3. dist_symmetry 공리를 이용해 dist y x 를 dist x y 로 바꾼다.
  -- 4. 0 ≤ 2 * dist x y 가 도출되므로, 양변을 2로 나누어 증명을 완료한다.
  sorry

theorem completion_exists : 1 + 1 = 2 -- 문법을 위한 가짜 수식
/-
  Metric Space X = (X, d) 에 대해,
  complete Metric Space X_hat = (X_hat, d_hat) 이 존재한다.
  이 때, X_hat 은 X 와 isometric 한 W 를 포함한다.
  또한, W 는 X_hat 에서 dense 하다.

  X_hat 은 isometric 한 space 를 제외하고 유일하며,
  이는 만약 X 와 isometric 한 W_tilde 에 대해 dense 하면서,
  complete metric space 인 X_tilde 가 있다면,
  X_hat 과 X_tilde 는 isometric 하다.
-/
  := sorry
  -- 1. X_hat = (X_hat, d_hat) 를 구성한다.
  -- 2. isomteric 한 T(X → W) 를 만든다. closure W = X_hat
  -- 3. 1, 2번을 바탕으로 X_hat 이 complete 함을 증명한다.
  -- 4. isometric 을 제외하고, X_hat 이 unique 함을 증명한다.

  -- 위의 과정은 같은 극한점(limit point) 를 가지면, 동등한 수열로 보는
  -- equivalence classes x_hat, y_hat 등을 이용한다.

end KreyszigCh1
