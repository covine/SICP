#lang racket

(define square (lambda (x) (* x x)))


(define (compose p g)
  (lambda (x) (p (g x))))


(define (repeated p n)
  (lambda (x) (if (= n 1)
                  (p x)
                  ((compose p (repeated p (- n 1))) x))))

               

((repeated square 2) 5)