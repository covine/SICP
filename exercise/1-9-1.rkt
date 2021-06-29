#lang racket
(define (+ a b)
  (if (= a 0) b (add1 (+ (sub1 a) b))))

#|
recursive
Because the process generated is a chain of deferred operations.
|#
(+ 4 5)
(add1 (+ 3 5))
(add1 (add1 (+ 2 5)))
(add1 (add1 (add1 (+ 1 5))))
(add1 (add1 (add1 (add1 (+ 0 5)))))
(add1 (add1 (add1 (add1 5))))
(add1 (add1 (add1 6)))
(add1 (add1 7))
(add1 8)
9