#lang racket

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 1 2))
((lambda (m) (m 1 2)) (lambda (p q) p))
((lambda (p q) p) 1 2)

#||#

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 1 2))
((lambda (m) (m 1 2)) (lambda (p q) q))
((lambda (p q) q) 1 2)