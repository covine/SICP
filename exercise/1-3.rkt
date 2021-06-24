#lang racket
(define (p a b c)
  (cond ((and (< c a) (< c b)) (+ (* a a) (* b b)))
        ((and (< a b) (< a c)) (+ (* b b) (* c c)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))))
(p 1 2 3)
(p -1 2 3)
(p 1 -2 3)
(p 1 2 -3)