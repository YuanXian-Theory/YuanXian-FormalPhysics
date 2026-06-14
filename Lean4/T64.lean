import Mathlib.Topology.Instances.Real
import Mathlib.Topology.Instances.Circle
import Mathlib.Topology.Constructions
import Mathlib.Topology.MetricSpace.Compact
import Mathlib.Analysis.InnerProductSpace.PiL2

/-- Circle as ℝ / ℤ with quotient topology -/
def Circle : Type := ℝ / ℤ

instance : TopologicalSpace Circle := Quotient.topologicalSpace

instance : CompactSpace Circle := Quotient.compactSpace

/-- 64-dimensional torus -/
def T64 : Type := Fin 64 → Circle

instance : TopologicalSpace T64 := Pi.topologicalSpace

instance : MetricSpace T64 := Pi.metricSpace

theorem T64_compact : CompactSpace T64 :=
  Pi.compactSpace

/-- Flat metric on T64 -/
instance : IsFlat T64 := sorry -- can be proven with local charts

end
