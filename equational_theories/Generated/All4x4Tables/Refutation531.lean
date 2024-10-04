
import equational_theories.AllEquations
import equational_theories.FactsSyntax
import equational_theories.MemoFinOp
import equational_theories.DecideBang

/-!
This file is generated from the following operator table:
[[1,2,5,6,4,3,7,0],[4,3,0,7,1,2,6,5],[2,1,7,0,3,4,5,6],[0,6,4,2,5,7,3,1],[7,5,2,4,6,0,1,3],[6,0,3,1,7,5,4,2],[3,4,6,5,2,1,0,7],[5,7,1,3,0,6,2,4]]
-/

set_option linter.unusedVariables false

/-! The magma definition -/
def «FinitePoly [[1,2,5,6,4,3,7,0],[4,3,0,7,1,2,6,5],[2,1,7,0,3,4,5,6],[0,6,4,2,5,7,3,1],[7,5,2,4,6,0,1,3],[6,0,3,1,7,5,4,2],[3,4,6,5,2,1,0,7],[5,7,1,3,0,6,2,4]]» : Magma (Fin 8) where
  op := memoFinOp fun x y => [[1,2,5,6,4,3,7,0],[4,3,0,7,1,2,6,5],[2,1,7,0,3,4,5,6],[0,6,4,2,5,7,3,1],[7,5,2,4,6,0,1,3],[6,0,3,1,7,5,4,2],[3,4,6,5,2,1,0,7],[5,7,1,3,0,6,2,4]][x.val]![y.val]!

/-! The facts -/
@[equational_result]
theorem «Facts from FinitePoly [[1,2,5,6,4,3,7,0],[4,3,0,7,1,2,6,5],[2,1,7,0,3,4,5,6],[0,6,4,2,5,7,3,1],[7,5,2,4,6,0,1,3],[6,0,3,1,7,5,4,2],[3,4,6,5,2,1,0,7],[5,7,1,3,0,6,2,4]]» :
  ∃ (G : Type) (_ : Magma G), Facts G [1368, 1587, 2805] [411, 614, 817, 1020, 1226, 1229, 1231, 1241, 1248, 1252, 1276, 1278, 1289, 1312, 1316, 1325, 1429, 1432, 1434, 1442, 1444, 1455, 1481, 1488, 1492, 1515, 1519, 1528, 1629, 1832, 2035, 2238, 2441, 2647, 2650, 2652, 2660, 2662, 2673, 2699, 2706, 2710, 2733, 2737, 2746, 2847, 3050, 3253, 3456, 3659, 3862, 4065, 4270, 4273, 4275, 4283, 4290, 4320, 4380, 4585, 4588, 4590, 4598, 4605, 4635] :=
    ⟨Fin 8, «FinitePoly [[1,2,5,6,4,3,7,0],[4,3,0,7,1,2,6,5],[2,1,7,0,3,4,5,6],[0,6,4,2,5,7,3,1],[7,5,2,4,6,0,1,3],[6,0,3,1,7,5,4,2],[3,4,6,5,2,1,0,7],[5,7,1,3,0,6,2,4]]», by decideFin!⟩
