import equational_theories.Completeness
import equational_theories.Conjecture
import equational_theories.FreeMagma

local infix:60 " ≃ " => MagmaLaw.mk

def dualizeLaw {α : Type} (law : MagmaLaw α) : MagmaLaw α :=
  dualizeTree law.lhs ≃ dualizeTree law.rhs

theorem DualizeLawIsInvolution {α : Type} (law : MagmaLaw α) : dualizeLaw (dualizeLaw law) = law :=
  Eq.trans
    (congrArg (fun expr ↦ expr ≃ (dualizeTree $ dualizeTree law.rhs)) (DualizeTreeIsInvolution law.lhs))
    (congrArg (fun expr ↦ law.lhs ≃ expr) (DualizeTreeIsInvolution law.rhs))

inductive DualMagma (α : Type) [Magma α]
  | DualWrap : α → DualMagma α

def dualWrap {G : Type} [Magma G] : (G → DualMagma G) := DualMagma.DualWrap

def dualUnwrap {G : Type} [Magma G] : (DualMagma G → G)
  | DualMagma.DualWrap x => x

instance {G : Type} [Magma G] : Magma (DualMagma G) where
  op x y := dualWrap $ (dualUnwrap y) ∘ (dualUnwrap x)

-- TODO: Once we have an API for magma isomorphism, prove dualWrap and dualUnwrap are isomorphisms

theorem DualMapIsAntihomomorphism (G : Type) [Magma G] : ∀ x y : G, dualWrap (x ∘ y) = dualWrap y ∘ dualWrap x :=
  fun _ _ ↦ refl _

theorem DualMapCancellable (G : Type) [Magma G] : ∀ x y : G, dualWrap x = dualWrap y → x = y :=
  fun _ _ eq ↦ congrArg dualUnwrap eq

theorem EvalReversedInDualMagma {α : Type} (G : Type) [Magma G]
  (expr : FreeMagma α) (sub : α → G) : dualWrap (evalInMagma sub expr) = evalInMagma (dualWrap ∘ sub) (dualizeTree expr) :=
  match expr with
  | FreeMagma.Leaf n => Eq.refl (dualWrap $ sub n)
  | FreeMagma.Fork leftExpr rightExpr => by
    let subd := dualWrap ∘ sub
    have leftCase : dualWrap (evalInMagma sub leftExpr) = evalInMagma subd (dualizeTree leftExpr) := EvalReversedInDualMagma G leftExpr sub
    have rightCase : dualWrap (evalInMagma sub rightExpr) = evalInMagma subd (dualizeTree rightExpr) := EvalReversedInDualMagma G rightExpr sub
    have decompEval : evalInMagma sub (leftExpr ⋆ rightExpr) = (evalInMagma sub leftExpr) ∘ (evalInMagma sub rightExpr) := refl _
    have decompDualEval : (evalInMagma subd (dualizeTree rightExpr) ∘ (evalInMagma subd (dualizeTree leftExpr))) = evalInMagma subd (dualizeTree (leftExpr ⋆ rightExpr)) := refl _
    exact Eq.trans
      (congrArg dualWrap decompEval) $ Eq.trans
      (DualMapIsAntihomomorphism G _ _) $ Eq.trans
      (congrArg (fun t ↦ t ∘ (dualWrap (evalInMagma sub leftExpr))) rightCase) $ Eq.trans
      (congrArg (fun t ↦ (evalInMagma subd (dualizeTree rightExpr)) ∘ t) leftCase)
      decompDualEval

theorem EvalPreservedInDoubleDualMagma {α : Type} (G : Type) [Magma G]
  (expr : FreeMagma α) (sub : α → G) : dualWrap (dualWrap (evalInMagma sub expr)) = evalInMagma (dualWrap ∘ (dualWrap ∘ sub)) expr :=
  Eq.trans
    (congrArg dualWrap (EvalReversedInDualMagma G expr sub)) $ Eq.trans
    (EvalReversedInDualMagma (DualMagma G) (dualizeTree expr) (dualWrap ∘ sub))
    (congrArg (evalInMagma (dualWrap ∘ dualWrap ∘ sub)) (DualizeTreeIsInvolution expr))

theorem DualizeLawFromMagma {α : Type} (G : Type) [Magma G]
  (law : MagmaLaw α) (pf : G ⊧ law) : DualMagma G ⊧ dualizeLaw law := by
  intro subd
  let sub := dualUnwrap ∘ subd
  let subd' := dualWrap ∘ sub
  have subEquiv : subd' = subd := funext (fun n ↦ congrArg dualWrap (refl _))
  have eq : evalInMagma sub law.1 = evalInMagma sub law.2 := pf sub
  have eqd' : evalInMagma subd' (dualizeTree law.1) = evalInMagma subd' (dualizeTree law.2) := Eq.trans
    (Eq.symm $ EvalReversedInDualMagma G law.lhs sub) $ Eq.trans
    (congrArg dualWrap eq)
    (EvalReversedInDualMagma G law.rhs sub)
  have eqd : evalInMagma subd (dualizeTree law.1) = evalInMagma subd (dualizeTree law.2) :=
    Eq.rec (motive := fun f _ ↦ evalInMagma f (dualizeTree law.1) = evalInMagma f (dualizeTree law.2)) eqd' subEquiv
  exact eqd

theorem UndualizeLawFromDualMagma {α : Type} (G : Type) [Magma G]
  (law : MagmaLaw α) (dualPf : DualMagma G ⊧ dualizeLaw law) : G ⊧ law := by
  intro sub
  let subd := dualWrap ∘ sub
  have dualLawSpecialized : evalInMagma subd (dualizeTree law.1) = evalInMagma subd (dualizeTree law.2) := dualPf subd
  exact (DualMapCancellable G _ _ (Eq.trans
    (EvalReversedInDualMagma G law.1 sub) $ Eq.trans
    dualLawSpecialized
    (Eq.symm $ EvalReversedInDualMagma G law.2 sub)))

theorem DualizeLawFromDualMagma {α : Type} (G : Type) [Magma G]
  (law : MagmaLaw α) (dualPf : DualMagma G ⊧ law) : G ⊧ dualizeLaw law := by
  have satDoubleDual : DualMagma G ⊧ dualizeLaw (dualizeLaw law) := Eq.ndrec dualPf (Eq.symm $ DualizeLawIsInvolution law)
  exact (UndualizeLawFromDualMagma G (dualizeLaw law) satDoubleDual)

theorem DualizeEquationLawImplication
  {α : Type} (law1 law2 : MagmaLaw α) (imp : ∀ (G : Type) [Magma G], G ⊧ law1 → G ⊧ law2)
  : (∀ (H : Type) [Magma H], H ⊧ dualizeLaw law1 → H ⊧ dualizeLaw law2) := by
  intros G _ satDualLaw1
  have dualSatLaw1 : DualMagma G ⊧ law1 := Eq.ndrec
    (motive := fun (l : MagmaLaw α) ↦ DualMagma G ⊧ l)
    (DualizeLawFromMagma G (dualizeLaw law1) $ satDualLaw1)
    (DualizeLawIsInvolution law1)
  have dualSatLaw2 : DualMagma G ⊧ law2 := imp (DualMagma G) dualSatLaw1
  exact (DualizeLawFromDualMagma G law2 dualSatLaw2)
