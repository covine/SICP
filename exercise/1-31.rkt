#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

#| a |#

(define (factorial n)
  (define (next a)
    (+ a 1))
  (define (term a)
    a)

  (product term 1 next n))


(factorial 1)
(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)
(factorial 6)
(factorial 7)

(define (pi n)
  (define (next a)
    (+ a 2.0))
  (define (term a)
    (* (/ (- a 1.0) a) (/ (+ a 1.0) a)))

  (* 4.0 (product term 3 next n)))

(pi 100)
(pi 10000)

#| b |#

(define (i-product term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (* result (term i)))))

  (iter (next a) (term a)))
  
(define (i-pi n)
  (define (next a)
    (+ a 2.0))
  (define (term a)
    (* (/ (- a 1.0) a) (/ (+ a 1.0) a)))

  (* 4.0 (i-product term 3 next n)))

(i-pi 100)
(i-pi 10000)


