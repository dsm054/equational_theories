/-
  This file defines the dual word and proves Lemma 3.5, that is
  `w ≃ w' ⇒ w'' ≃ w'''` implies `w.op ≃ w'.op ⇒ w''.op ≃ w'''.op`
-/

import equational_theories.FreeMagma
import equational_theories.MagmaLaw
import equational_theories.Preorder

open FreeMagma

variable {α : Type _}

def FreeMagma.dual (w : FreeMagma α) : FreeMagma α :=
match w with
| .Leaf x => .Leaf x
| .Fork w₁ w₂ => .Fork w₂.dual w₁.dual

/--
`FreeMagma.dual` is indeed a dual (an involution).
-/
@[simp]
theorem FreeMagma.dual_dual (w : FreeMagma α) : w.dual.dual = w := by
 induction w <;> simp [dual, *]

@[simp]
def Op (G : Type) : Type := G

variable {G : Type} [Magma G]

@[simp]
instance opMagma : Magma (Op G) := { op := λ (x y : G) ↦ (y ◇ x : G) }

def Magma.opHom : G → Op G := fun x => x

theorem evalInMagmaOp (φ : α → G) (w : FreeMagma α):
  evalInMagma (G := Op G) φ w.dual = evalInMagma (G := G) φ w := by
  cases w; trivial
  case Fork w₁ w₂ => simp only [Op, evalInMagma, opMagma]; repeat rw [evalInMagmaOp]

theorem models.Op {w₁ w₂ : FreeMagma α} (h : G ⊧ w₁ ≃ w₂) :
    (Op G) ⊧ w₁.dual ≃ w₂.dual := by
  intro φ
  simp only [satisfiesPhi, _root_.Op, opMagma]
  repeat rw [@evalInMagmaOp]
  apply h

namespace Law.MagmaLaw

def dual (l : MagmaLaw α) : MagmaLaw α := { lhs := l.lhs.dual, rhs := l.rhs.dual }

theorem law_dual_dual (l : MagmaLaw α) : l.dual.dual = l := by simp [dual]

theorem satisfiesPhi_dual {l : MagmaLaw α} {φ : α → G}
  (h : satisfiesPhi (Magma.opHom ∘ φ) l) : satisfiesPhi φ l.dual := by
  simp only [satisfiesPhi, Op, opMagma, dual] at *
  rw [← evalInMagmaOp φ l.lhs.dual, ← evalInMagmaOp φ l.rhs.dual]
  simp only [Op, opMagma, dual_dual]
  exact h

theorem satisfies_dual_dual {l : MagmaLaw α} (h : (Op G) ⊧ l) : G ⊧ l.dual :=
  fun φ ↦ satisfiesPhi_dual (h (Magma.opHom ∘ φ))

theorem implies_iff_dual {l₁ l₂ : MagmaLaw α} : l₁.implies l₂ ↔ l₁.dual.implies l₂.dual := by
  constructor
  · intro h G _ hsat
    exact satisfies_dual_dual (h (law_dual_dual l₁ ▸ satisfies_dual_dual hsat))
  · intro h G _ hsat
    rw [← law_dual_dual l₂]
    rw [← law_dual_dual l₁] at hsat
    exact satisfies_dual_dual (h (law_dual_dual l₁ ▸ satisfies_dual_dual hsat))

end Law.MagmaLaw
