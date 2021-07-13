#lang racket

(define (cont-frac n d k)
  (define (frac i)
    (cond ((= i k) (/ (n k) (d k)))
          (else (/ (n i) (+ (d i) (frac (+ i 1)))))))

  (frac 1))

(/ (- (sqrt 5) 1) 2)


#| a |#
#| k = 11 |#
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 2)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 3)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 4)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 5)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 6)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 7)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 8)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)

#| b |#

(newline)

(define (i-cont-frac n d k)
  (define (i-frac i result)
    (cond ((= i 0) result)
          (else (i-frac (- i 1) (/ (n i) (+ (d i) result))))))

  (i-frac (- k 1) (/ (n k) (d k))))

(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 2)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 3)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 4)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 5)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 6)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 7)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 8)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)

