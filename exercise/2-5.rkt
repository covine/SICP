#lang racket

(define (cons a b)
  (define (mul x t)
    (if (= t 0)
        1
        (* x (mul x (- t 1)))))
  (* (mul 2 a) (mul 3 b)))

(define (car c)
  (define (div r count) (if (= 0 (remainder r 2))
                             (div (/ r 2) (+ 1 count))
                             count))
  
  (div c 0))

(define (cdr c)
  (define (div r count) (if (= 0 (remainder r 3))
                             (div (/ r 3) (+ 1 count))
                             count))
  
  (div c 0))


(newline)
(cons 0 0)
(car (cons 0 0))
(cdr (cons 0 0))

(newline)
(cons 1 1)
(car (cons 1 1))
(cdr (cons 1 1))

(newline)
(cons 2 3)
(car (cons 2 3))
(cdr (cons 2 3))

(newline)
(cons 5 6)
(car (cons 5 6))
(cdr (cons 5 6))




