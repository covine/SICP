#lang racket

#|
itertive
time: O(n)
space: O(n)
(4 9 16 25) (1)
(9 16 25) (4 1)
...
(25) (16 9 4 1)
(25 16 9 4 1)
|#

(define (reverse l)
  (define (r i n)
    (if (null? i)
        n
        (r (cdr i) (cons (car i) n))))
  (r l null))


(list 1 4 9 16 25)
(reverse (list 1 4 9 16 25))
  
  


  
  