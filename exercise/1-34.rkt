#lang racket

(define (f g) (g 2))

(define (square x) (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))


(f f)

((lambda (g) (g 2)) (lambda (g) (g 2)))

((lambda (g) (g 2)) 2)


#|
application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
|#
(2 2)