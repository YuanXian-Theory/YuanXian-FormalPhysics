import Mathlib.Analysis.SpecificLimits.BanachFixedPoint
import Mathlib.Analysis.NormedSpace.Basic
import Mathlib.Topology.MetricSpace.Contracting

variable {X : Type*} [MetricSpace X] [NormedAddCommGroup X] [ProperSpace X]

def αFSC : ℝ := 1 / 137.035999084

def involution (x : X) : X := -x

noncomputable def evolve (ψ : X) : X :=
  ψ + αFSC • (involution ψ - ψ)

lemma evolve_contraction :
    IsContrMapWithConst (1 - αFSC) evolve := by
  have hα : 0 < αFSC ∧ αFSC < 1 := by
    norm_num [αFSC]; linarith
  intro x y
  calc
    dist (evolve x) (evolve y)
      = dist (x + αFSC • (involution x - x)) (y + αFSC • (involution y - y)) := rfl
    _ ≤ |1 - αFSC| * dist x y := by
      simp [evolve, involution]
      rw [dist_add_add_cancel, dist_smul]
      apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
      exact dist_neg_neg _ _
    _ = (1 - αFSC) * dist x y := by
      rw [abs_of_pos (by linarith [hα])]
  done

theorem unique_fixed_point : ∃! ψ : X, evolve ψ = ψ := by
  apply banachFixedPoint
  exact evolve_contraction

noncomputable def fixedPoint : X := Classical.choose unique_fixed_point

theorem fixed_point_property : evolve fixedPoint = fixedPoint :=
  Classical.choose_spec unique_fixed_point

theorem converges_to_fixed (ψ₀ : X) :
    Tendsto (λ n => (evolve^[n]) ψ₀) atTop (𝓝 fixedPoint) :=
  banachFixedPoint_converges evolve evolve_contraction ψ₀
