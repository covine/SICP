#lang racket

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)


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