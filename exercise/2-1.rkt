#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n (/ n g))
          (d (/ d g)))
      (if (and (> n 0) (< d 0))
          (cons (- n) (- d))
          (cons n d)))))


(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 10 -6))
(print-rat (make-rat -20 6))
(print-rat (make-rat -10 -6))
(print-rat (make-rat 10 6))