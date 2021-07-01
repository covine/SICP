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

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define sqrt-five (sqrt-new 5))

(define a (/ (+ 1 sqrt-five) 2))
(define b (/ (- 1 sqrt-five) 2))

(define (N x n)
  (cond ((= n 0) 1)
        ((= n 1) x)
        (else (* x (N x (- n 1))))))
    
(define (Prove n)
  (/ (- (N a n) (N b n) ) sqrt-five))

(define (P x y)
  (if (< (abs (- x y)) 0.5)
      #true
      #false
      ))

(P (fib 0) (Prove 0))
(P (fib 1) (Prove 1))
(P (fib 5) (Prove 5))
(P (fib 10) (Prove 10))





