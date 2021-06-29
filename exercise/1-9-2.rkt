#lang racket
(define (+ a b)
  (if (= a 0) b (+ (sub1 a) (add1 b))))

#|
iterative
Because this process do not grow and shrink.
And it's state can be summarized by a fixed number of state variables, together
with a fixed rule that describes how the state variables should be updated as
the process moves from state to state.
|#
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)

