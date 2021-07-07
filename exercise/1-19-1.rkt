#lang racket

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 1)
(fib 7)
(fib 10)
(fib 20)

(define (i-fib n)
  (i-fib-iter 1 0 n))

(define (i-fib-iter a b count)
  (if (= count 0)
      b
      (i-fib-iter (+ a b) a (- count 1))))

(i-fib 1)
(i-fib 7)
(i-fib 10)
(i-fib 20)


(define (even? n)
  (= (remainder n 2) 0))

(define (iter-fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(iter-fib 1)
(iter-fib 7)
(iter-fib 10)
(iter-fib 20)