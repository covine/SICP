#lang racket

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n a)
  (cond ((not (< a n)) #t)
    ((= (expmod a n n) a) (fermat-test n (+ a 1)))
    (else #f)))
    


(define (fast-prime? n)
  (fermat-test n 2))


(fast-prime? 561)
(fast-prime? 1105)
(fast-prime? 1729)
(fast-prime? 2465)
(fast-prime? 2821)
(fast-prime? 6601)


