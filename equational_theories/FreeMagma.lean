import Mathlib.Order.Defs

import equational_theories.Conjecture
import equational_theories.AllEquations

universe u
universe v

inductive FreeMagma (α : Type u)
  | Leaf : α → FreeMagma α
  | Fork : FreeMagma α → FreeMagma α → FreeMagma α
  deriving DecidableEq

instance (α : Type u) : Magma (FreeMagma α) where
  op := FreeMagma.Fork

infixl:65 " ⋆ " => FreeMagma.Fork

@[simp]
theorem FreeMagma_op_eq_fork (α : Type u) (a b : FreeMagma α) : a ∘ b = a ⋆ b := rfl

notation "Lf" => FreeMagma.Leaf

instance FreeMagma.Magma {α} : Magma (FreeMagma α) := ⟨ Fork ⟩

def fmapFreeMagma {α : Type u} {β : Type v} (f : α → β) : FreeMagma α → FreeMagma β
  | Lf a => FreeMagma.Leaf (f a)
  | lchild ⋆ rchild => FreeMagma.Fork (fmapFreeMagma f lchild) (fmapFreeMagma f rchild)

def evalInMagma {α : Type u} {G : Type v} [Magma G] (f : α -> G) : FreeMagma α → G
  | Lf a => f a
  | lchild ⋆ rchild => (evalInMagma f lchild) ∘ (evalInMagma f rchild)

def dualizeTree {α : Type u} : FreeMagma α → FreeMagma α
  | FreeMagma.Leaf a => FreeMagma.Leaf a
  | FreeMagma.Fork lchild rchild => FreeMagma.Fork (dualizeTree rchild) (dualizeTree lchild)

theorem DualizeTreeIsInvolution {α : Type u} (t : FreeMagma α) : dualizeTree (dualizeTree t) = t :=
  match t with
  | FreeMagma.Leaf a => refl (Lf a)
  | FreeMagma.Fork lchild rchild => Eq.trans
    (congrArg (fun s ↦ (dualizeTree $ dualizeTree lchild) ⋆ s) (DualizeTreeIsInvolution rchild))
    (congrArg (fun s ↦ s ⋆ rchild) (DualizeTreeIsInvolution lchild))

-- Metatheorem: if x0 = f(x1,x2,...), then x = y.
theorem ExpressionEqualsAnything_implies_Equation2 (G: Type u) [Magma G]
  : (∃ n : Nat, ∃ expr : FreeMagma (Fin n), ∀ x : G, ∀ sub : Fin n → G, x = evalInMagma sub expr) → Equation2 G := by
  intro ⟨n, expr, univ⟩ x y
  let constx : Fin n → G := fun _ ↦ x
  exact (univ x constx).trans (univ y constx).symm

theorem Equation37_implies_Equation2 (G : Type u) [Magma G]
  : (∀ x y z w : G, x = (y ∘ z) ∘ w) → Equation2 G :=
  fun univ ↦ ExpressionEqualsAnything_implies_Equation2 G ⟨
    3,
    (Lf 0 ⋆ Lf 1) ⋆ Lf 2, -- The syntactic representation of (y ∘ z) ∘ w
    fun k sub ↦ univ k (sub 0) (sub 1) (sub 2)
  ⟩

theorem Equation514_implies_Equation2 (G : Type u) [Magma G]
  : (∀ x y : G, x = y ∘ (y ∘ (y ∘ y))) → Equation2 G :=
  fun univ ↦ ExpressionEqualsAnything_implies_Equation2 G ⟨
    1,
    Lf 0 ⋆ (Lf 0 ⋆ (Lf 0 ⋆ Lf 0)), -- The syntactic representation of y ∘ (y ∘ (y ∘ y)))
    fun k sub ↦ univ k (sub 0)
  ⟩

def EquationLaw := FreeMagma Nat × FreeMagma Nat
