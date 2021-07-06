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


(define (iter-mul a b)
  (cond ((= b 0) 0)
        (else (i-mul a b 0))))
  
#|
even: pre + 0 + a * (b / 2)
odd: pre + a + a * ((b-1) / 2)
|#
(define (i-mul a b pre)
  (cond ((= b 0) pre)
        ((even? b) (i-mul (double a) (halve b) pre))
        (else (i-mul (double a) (halve (- b 1)) (+ pre a)))))


(iter-mul 0 0)
(iter-mul 0 1)
(iter-mul 1 0)
(iter-mul 1 1)
(iter-mul 4 5)
(iter-mul 400 500)