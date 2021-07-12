#lang racket


(define (cube x) (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter (next a) (term a)))

#| y0 + 4* y1 + y2 |#
(define (p f a b n)
  (define (h) (/ (- b a) n))
  (define (term k)
    (+ (f (+ (* (h) (- k 2)) a))
       (* 4 (f (+ (* (h) (- k 1)) a)))
       (f (+ (* (h) k) a))))
  
  (define (next x)
    (+ x 2))
  
  (* (sum term 2 next n)
     (/ (h) 3.0)))


(p cube 0 1 100)
(p cube 0 1 1000)


