#lang racket

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment seg)
  (let ((x (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2))
        (y (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))
    (make-point x y)))


(define (make-rectangle seg-a seg-b)
  (cons seg-a seg-b))

(define (seg-a rectangle)
  (car rectangle))

(define (seg-b rectangle)
  (cdr rectangle))

(define (cal-perimeter rectangle)
  (let ((delta-x (- (x-point (start-segment (seg-a rectangle))) (x-point (start-segment (seg-b rectangle)))))
        (delta-y (- (y-point (start-segment (seg-a rectangle))) (y-point (start-segment (seg-b rectangle)))))
        (delta-a (- (x-point (start-segment (seg-a rectangle))) (x-point (end-segment (seg-b rectangle)))))
        (delta-b (- (y-point (start-segment (seg-a rectangle))) (y-point (end-segment (seg-b rectangle))))))
    (* (+ (sqrt (+ (* delta-x delta-x) (* delta-y delta-y))) (sqrt (+ (* delta-a delta-a) (* delta-b delta-b)))) 2)))


(define (cal-area rectangle)
  (let ((delta-x (- (x-point (start-segment (seg-a rectangle))) (x-point (start-segment (seg-b rectangle)))))
        (delta-y (- (y-point (start-segment (seg-a rectangle))) (y-point (start-segment (seg-b rectangle)))))
        (delta-a (- (x-point (start-segment (seg-a rectangle))) (x-point (end-segment (seg-b rectangle)))))
        (delta-b (- (y-point (start-segment (seg-a rectangle))) (y-point (end-segment (seg-b rectangle))))))
    (* (sqrt (+ (* delta-x delta-x) (* delta-y delta-y))) (sqrt (+ (* delta-a delta-a) (* delta-b delta-b))))))
  

(cal-perimeter (make-rectangle (make-segment (make-point 0 5) (make-point 10 0)) (make-segment (make-point 0 0) (make-point 10 5))))
(cal-area (make-rectangle (make-segment (make-point 0 5) (make-point 10 0)) (make-segment (make-point 0 0) (make-point 10 5))))
  
