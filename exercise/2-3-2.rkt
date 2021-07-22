#lang racket

#| point abstraction |#
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


#| rectangle abstraction |#
(define (make-rectangle a b c d)
  (cons (cons a b) (cons c d)))

(define (a r)
  (car (car r)))

(define (b r)
  (cdr (car r)))

(define (c r)
  (car (cdr r)))

(define (d r)
  (cdr (cdr r)))

(define (len-x r)
  (let ((delta-x (- (x-point (a r)) (x-point (d r))))
        (delta-y (- (y-point (a r)) (y-point (d r)))))
    (sqrt (+ (* delta-x delta-x) (* delta-y delta-y)))))

(define (len-y r)
  (let ((delta-x (- (x-point (a r)) (x-point (b r))))
        (delta-y (- (y-point (a r)) (y-point (b r)))))
    (sqrt (+ (* delta-x delta-x) (* delta-y delta-y)))))

(len-x (make-rectangle (make-point 0 5) (make-point 10 5) (make-point 10 0) (make-point 0 0)))
(len-y (make-rectangle (make-point 0 5) (make-point 10 5) (make-point 10 0) (make-point 0 0)))


(define (cal-perimeter r)
    (* (+ (len-x r) (len-y r)) 2))


(define (cal-area r)
  (* (len-x r) (len-y r)))
  

(cal-perimeter (make-rectangle (make-point 0 5) (make-point 10 5) (make-point 10 0) (make-point 0 0)))
(cal-area (make-rectangle (make-point 0 5) (make-point 10 5) (make-point 10 0) (make-point 0 0)))


