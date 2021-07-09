#lang racket

(define (square x)
  (* x x))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))


(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)

(define (prime? n start-time)
  (if (= n (smallest-divisor n))
      (report-prime (- (current-inexact-milliseconds) start-time) n)
      #f))

(define (display-end)
  (display "end")
  (newline))

(define (search-for-primes n t)
  (cond ((< t 1) (display-end))
        ((prime? n (current-inexact-milliseconds)) (search-for-primes (+ n 2) (- t 1)))
        (else (search-for-primes (+ n 2) t))))      

     

(search-for-primes 1001 3)
(search-for-primes 10001 3)
(search-for-primes 100001 3)
(search-for-primes 1000001 3)

#|
The results support the prediction.
|#
