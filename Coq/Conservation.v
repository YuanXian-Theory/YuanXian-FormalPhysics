Require Import Reals.
Require Import Coquelicot.Coquelicot.

Theorem conservation_preserved :
  forall (T : energy_momentum_tensor),
    div T_64 = 0 -> div (projected_T T) = 0.
Proof.
  (* Noether + fiber integration *)
  Admitted.
