#lang racket
(define (sqrt guess x)
  (if (< (abs (- (square guess) x)) 0.001)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (sqrt-iter old new x)
  (if (good-enough? old new)
      old
      (sqrt-iter new (improve new x) x)))

(define (good-enough? old new)
  (< (abs (- new old)) (/ old 1000)))
  
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt-new x)
  (sqrt 1.0 x))

(sqrt-new 9)

