Require Import Reals.
Require Import Coquelicot.Coquelicot.

Section Reduction.

Parameter projection : T64 -> R^4.
Parameter fiber : R^4 -> Ensemble T64.

Definition effective_potential (φ : R^4 -> R) : R^4 -> R :=
  fun y => ∫_(fiber y) V (φ y + high_modes) dμ60.

Definition effective_action (φ : R^4 -> R) : R :=
  ∫ (1/2 * ||grad φ||^2 + effective_potential φ) dy.

Lemma reduction_preserves_stationary :
  forall Ψ, stationary_point action_64 Ψ ->
            stationary_point effective_action (zero_mode Ψ).
Proof.
  intros.
  (* fiber integral commutes with variation *)
  Admitted.

End Reduction.
