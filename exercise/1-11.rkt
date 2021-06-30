#lang racket
#| recursive |#
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)

#| iterative |#
(define (i n)
  (if (< n 3)
      n
      (iter-i n 3 (i 2) (i 1) (i 0))))

(define (iter-i n index a b c)
  (if (< index n)
      (iter-i n (+ index 1) (+ a (* 2 b) (* 3 c)) a b)
      (+ a (* 2 b) (* 3 c))))
  
(i 1)
(i 2)
(i 3)
(i 4)
(i 5)

