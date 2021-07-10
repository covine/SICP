#lang racket

#|
Obviously, (square (expmod base (/ exp 2) m) is different with
(* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m).
As we learned before, for square, the parameter (expmod base (/ exp 2) m) is
evaluated once. In contrast, for the second procedure, (expmod base (/ exp 2) m)
is evaluated twice. 2 will be multipied by log(n) times.
So, we get Θ(n) processes.
|#