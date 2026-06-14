Require Import Reals.
Require Import Coquelicot.Coquelicot.

Definition alpha := / 137.035999084.

Theorem lambda_suppression :
  casimir_energy_on_T60 ∼ (alpha ^ 64) * Planck_density.
Proof.
  Admitted.

Theorem casimir_correction :
  forall d : R, d < 100 * 10^(-9) ->
    |F_corrected d - F_standard d| / F_standard d ≤ alpha ^ 64.
Proof.
  Admitted.

Theorem lightest_KK_mass (R : R) :
  min_nz (fun n => sum n_i^2 / R^2) = 1 / R^2.
Proof.
  (* n = e_1 *)
  Admitted.
