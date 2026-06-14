import Mathlib.Topology.Instances.Real
import Mathlib.Topology.Instances.Circle
import Mathlib.Topology.Constructions
import Mathlib.Topology.MetricSpace.Compact
import Mathlib.Analysis.InnerProductSpace.PiL2

/-- Circle as quotient ℝ / ℤ -/
def Circle : Type := ℝ / ℤ deriving TopologicalSpace

instance : CompactSpace Circle := Quotient.compactSpace

/-- 64-dimensional torus -/
abbrev T64 := Fin 64 → Circle

instance : TopologicalSpace T64 := Pi.topologicalSpace
instance : MetricSpace T64 := Pi.metricSpace (λ _ => Quotient.metricSpace)

theorem T64_compact : CompactSpace T64 :=
  Pi.compactSpace

/-- Volume of T64 (normalized) -/
instance : MeasureSpace T64 := sorry -- Haar measure

end
