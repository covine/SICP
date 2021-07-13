#lang racket

(define (cont-frac n d k)
  (define (frac i)
    (cond ((= i k) (/ (n k) (d k)))
          (else (/ (n i) (+ (d i) (frac (+ i 1)))))))

  (frac 1))

(/ (- (sqrt 5) 1) 2)

(define (d i)
  (cond ((= 1 (remainder i 3)) 1)
        ((= 2 (remainder i 3)) (* 2 (+ (/ (- i 2) 3) 1)))
        ((= 0 (remainder i 3)) 1)))
(d 1)
(d 2)
(d 3)
(d 4)
(d 5)
(d 6)
(d 7)
(d 8)
(d 9)
(d 10)
(d 11)

(newline)

(define e 2.7182818284)
(- e 2)

(cont-frac (lambda (i) 1.0) d 1)
(cont-frac (lambda (i) 1.0) d 2)
(cont-frac (lambda (i) 1.0) d 3)
(cont-frac (lambda (i) 1.0) d 4)
(cont-frac (lambda (i) 1.0) d 5)
(cont-frac (lambda (i) 1.0) d 6)
(cont-frac (lambda (i) 1.0) d 7)
(cont-frac (lambda (i) 1.0) d 8)
(cont-frac (lambda (i) 1.0) d 9)
(cont-frac (lambda (i) 1.0) d 10)
(cont-frac (lambda (i) 1.0) d 11)

