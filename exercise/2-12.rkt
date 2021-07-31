#lang racket

(define (make-interval a b) (cons a b))

(define (make-center-percent c p)
  (make-interval (* c (+ 1 p)) (* c (- 1 p))))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (- (upper-bound i) (center i)) (center i)))
  
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(percent (make-center-percent 10 0.02))