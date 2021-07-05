#lang racket

#| recursive |#

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(fast-expt 3 0)
(fast-expt 3 1)
(fast-expt 3 9)
(fast-expt 3 10)

#| iter |#

(define (iter-expt b n)
  (cond ((= n 0) 1)
        (else (i-expt b n 1))))

(define (i-expt b n a)
  (cond ((= n 1) (* b a))
        ((even? n) (i-expt (square b) (/ n 2) a))
        (else (i-expt (square b) (/ (- n 1) 2) (* a b)))))

(iter-expt 3 0)
(iter-expt 3 1)
(iter-expt 3 9)
(iter-expt 3 10)

     
  