# Resources

> 이 문서는 공통 참고 자료를 모아둔 문서입니다.  
> 특정 주차에서 어떤 자료를 읽을지는 `notes/weekXX_*.md`를 함께 참고하세요.

## 이 문서를 참고해야 하는 경우

- 선형대수, ODE, PDE, 수치해석, 확률통계 기초 자료를 찾을 때
- Kreyszig, Teschl, Evans, Brenner & Scott, Kirsch의 역할을 구분할 때
- Deep Ritz, SINDy, WENDy, FNO, Spectral Bias 등 SciML 브릿지 자료를 확인할 때
- LLM이 자료 추천을 할 때 기준 자료 목록이 필요할 때

---

## 5. 공통 참고 자료

### 5.1 기초 수학 자료

#### MIT 18.06 Linear Algebra

용도:
- least squares
- projection
- eigenvalue
- positive definite matrix
- SVD의 기초 보강

MIT 18.06은 systems of equations, vector spaces, determinants, eigenvalues, similarity, positive definite matrices 등을 다루는 선형대수 강의다. ([MIT OpenCourseWare](https://ocw.mit.edu/courses/18-06-linear-algebra-spring-2010/?utm_source=chatgpt.com "Linear Algebra | Mathematics"))

---

#### MIT 18.03SC Differential Equations

용도:
- ODE 모델링
- 해석적 풀이
- 해의 의미
- 과학·공학 모델링 감각 보강

MIT 18.03SC는 자연 법칙을 미분방정식으로 모델링하고, 그 방정식을 풀고 해석하는 데 초점을 둔 독학형 강의다. ([MIT OpenCourseWare](https://ocw.mit.edu/courses/18-03sc-differential-equations-fall-2011/?utm_source=chatgpt.com "Differential Equations | Mathematics"))

---

#### MIT 18.330 Introduction to Numerical Analysis

용도:
- numerical error
- stability    
- ODE solver
- approximation
- numerical linear algebra

MIT 18.330은 numerical analysis 입문 자료로, root finding, interpolation, approximation, integration, differential equations, linear algebra의 direct/iterative method 등을 다룬다. ([Massachusetts Institute of Technology](https://www.mit.edu/?utm_source=chatgpt.com "MIT - Massachusetts Institute of Technology"))

---

#### MIT 18.05 Introduction to Probability and Statistics

용도:
- noise
- uncertainty
- inference
- regression
- confidence interval
- likelihood

MIT 18.05는 probability distributions, Bayesian inference, hypothesis testing, confidence intervals, linear regression 등을 포함하는 확률·통계 입문 강의다. ([MIT OpenCourseWare](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2022/?utm_source=chatgpt.com "Introduction to Probability and Statistics | Mathematics"))

---

### 5.2 코어 이론 교재

#### Kreyszig — Introductory Functional Analysis with Applications

사용 목적:
- metric space
- normed space
- Banach space
- Hilbert space
- bounded linear operator
- projection
- compactness / spectral idea

---

#### Teschl — Ordinary Differential Equations and Dynamical Systems

사용 목적:
- existence / uniqueness
- Picard iteration
- Grönwall inequality
- flow map
- dynamical systems 관점

---

#### Evans — Partial Differential Equations

사용 목적:
- 대표 PDE
- weak derivative
- Sobolev space
- weak solution
- energy method
- Lax–Milgram

---

#### Brenner & Scott — The Mathematical Theory of Finite Element Methods

사용 목적:
- Sobolev basics
- variational formulation
- Galerkin approximation
- Céa lemma

---

#### Kirsch — An Introduction to the Mathematical Theory of Inverse Problems

사용 목적:
- well-posedness
- ill-posedness
- regularization
- Tikhonov
- spectral filtering
- discretization as regularization

Kirsch의 책은 inverse problem, ill-posed problem, regularization method의 기본 어려움을 다루는 대학원 수준 교재로 소개되어 있다. ([Springer](https://link.springer.com/book/10.1007/978-3-030-63343-1?utm_source=chatgpt.com "An Introduction to the Mathematical Theory of Inverse Problems"))

---

### 5.3 SciML 브릿지 자료

#### Deep Ritz Method

용도:
- variational problem
- weak form
- energy minimization
- neural network trial function    

Deep Ritz 논문은 PDE에서 나오는 variational problem을 deep learning 기반으로 풀기 위한 방법을 제안한다. ([arXiv](https://arxiv.org/abs/1710.00211?utm_source=chatgpt.com "The Deep Ritz method: A deep learning-based numerical algorithm for solving variational problems"))

---

#### SINDy

용도:
- equation discovery
- sparse regression
- dynamical system identification

SINDy 논문은 measurement data에서 governing physical equation을 발견하기 위해 sparsity-promoting techniques, machine learning, nonlinear dynamical systems를 결합한다. ([arXiv](https://arxiv.org/abs/1509.03580?utm_source=chatgpt.com "Sparse identification of nonlinear dynamical systems"))

---

#### WENDy

용도:
- weak-form regression
- ODE parameter estimation
- noisy data
- solver-free inference

WENDy는 weak-form 기반으로 nonlinear ODE parameter를 추정하며, numerical differential equation solver에 의존하지 않고 measurement noise에 robust한 추정을 목표로 한다. ([arXiv](https://arxiv.org/abs/2302.13271?utm_source=chatgpt.com "Direct Estimation of Parameters in ODE Models Using WENDy: Weak-form Estimation of Nonlinear Dynamics"))

---

#### Fourier Neural Operator

용도:
- neural operator
- function space mapping
- PDE solution operator
- Fourier-space parameterization

FNO 논문은 기존 neural network가 finite-dimensional Euclidean space 사이의 mapping을 학습하는 데 집중한 반면, neural operator는 function space 사이의 mapping을 학습한다는 관점에서 출발한다. ([arXiv](https://arxiv.org/abs/2010.08895?utm_source=chatgpt.com "Fourier Neural Operator for Parametric Partial Differential Equations"))

---

#### Spectral Bias

용도:
- neural network의 주파수 학습 경향
- PDE 해의 고주파 성분
- Fourier analysis와 learning dynamics 연결

Rahaman et al.은 neural network가 low-frequency function을 더 빠르게 학습하는 경향을 Fourier analysis 관점에서 설명한다. ([Proceedings of Machine Learning Research](https://proceedings.mlr.press/v97/rahaman19a.html?utm_source=chatgpt.com "On the Spectral Bias of Neural Networks"))

---

