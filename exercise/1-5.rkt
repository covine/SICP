#lang racket
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

#|
If the interpreter is using applicative-order, (p) is evaluated first and
we will get the value (p) agian. It will loop forever and we can't get a result.
If the interpreter is using normal-order, we can get a result 0 since (p) will
not be evaluated.
|#

