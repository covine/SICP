#lang racket
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

#|
Because the parameters will be evaluated, else-clause will be evaluated and call sqrt-iter again.
It will cause a deed loop. But the special form <if> will act in a different way.
|#
(define (sqrt-iter-new guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new (improve guess x) x)))

(define (sqrt-new x)
  (sqrt-iter-new 1.0 x))

(sqrt-new 9)
