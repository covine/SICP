#lang racket

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(* 0 0)
(* 0 1)
(* 1 0)
(* 1 1)
(* 4 5)
(* 400 500)

#|
even a * (b/2) + a * (b/2)
odd a + a * ((b-1)/2) + a * ((b-1)/2)
|#

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (double (fast-mul a (halve (- b 1))))))))

(fast-mul 0 0)
(fast-mul 0 1)
(fast-mul 1 0)
(fast-mul 1 1)
(fast-mul 4 5)
(fast-mul 400 500)
      
      