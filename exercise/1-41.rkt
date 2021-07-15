#lang racket

(define (double p)
  (lambda (x) (p (p x))))

(define (inc x)
  (+ x 1))

(inc 1)

((double inc) 1)


#| 21 |#
(((double (double double)) inc) 5)