#lang racket

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod-o base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod-o base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod-o base (- exp 1) m))
          m))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))


(define (f-prime? n times start-time)
  (if (fast-prime? n times)
      (report-prime (- (current-inexact-milliseconds) start-time) n)
      #f))


(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)



(define (display-end)
  (display "end")
  (newline))

(define (search-for-primes n t)
  (cond ((< t 1) (display-end))
        ((f-prime? n 5 (current-inexact-milliseconds)) (search-for-primes (+ n 2) (- t 1)))
        (else (search-for-primes (+ n 2) t))))      

     

(search-for-primes 1001 3)
(search-for-primes 10001 3)
(search-for-primes 100001 3)
(search-for-primes 1000001 3)


#|
No.
It's quite slow.
Because expmod does not really need a to be multiplied n times.
|#