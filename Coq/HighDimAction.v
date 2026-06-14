Require Import Reals.
Require Import Coquelicot.Coquelicot.
Require Import Coquelicot.Hierarchy.

Section HighDim.

Parameter T64 : Type.
Parameter mu64 : Measure T64.

Definition high_dim_field := T64 -> R.

Definition lagrangian_64 (Ψ : high_dim_field) (x : T64) : R :=
  1/2 * (norm (grad Ψ x))^2 + V (Ψ x).

Definition action_64 (Ψ : high_dim_field) : R :=
  ∫_T64 (lagrangian_64 Ψ) dμ64.

Lemma euler_lagrange_64 (Ψ : high_dim_field) :
  stationary_point action_64 Ψ <-> (laplacian_64 Ψ - V' (Ψ) = 0).
Proof.
  Admitted.

End HighDim.
