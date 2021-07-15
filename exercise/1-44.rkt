#lang racket

(define square (lambda (x) (* x x)))


(define (compose p g)
  (lambda (x) (p (g x))))


(define (repeated p n)
  (lambda (x) (if (= n 1)
                  (p x)
                  ((compose p (repeated p (- n 1))) x))))


(define dx 1.0)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((smooth square) 1)
((smooth square) 2)
((smooth square) 3)
((smooth square) 4)


(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth square 2) 1)
((n-fold-smooth square 2) 2)
((n-fold-smooth square 2) 3)
((n-fold-smooth square 2) 4)
