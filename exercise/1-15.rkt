#lang racket
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))

#| As we can see, the procedure will be expanded to 5 steps.
Thus the procedure p is evaluated by 5 times.|#

#| The order of growth in space: Θ(log(n)) |#
#| The order of growth in steps: Θ(log(n)) |#
