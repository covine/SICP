#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (cube x)
  (* x x x))

(define square (lambda (x) (* x x)))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(display "sqrt")
(newline)
(sqrt 9)
(sqrt 10)
(sqrt 16)
(newline)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))

(display "cube")
(newline)
(cube-root 8)
(cube-root 9)
(cube-root 10)
(cube-root 16)
(cube-root 27)
(newline)

(define (fourth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (cube y))))) 1.0))

(display "fourth")
(newline)
(fourth-root 8)
(fourth-root 9)
(fourth-root 10)
(fourth-root 16)
(fourth-root 81)
(newline)

(define (fifth-root x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (* y (cube y))))))) 1.0))

(display "fifth")
(newline)
(fifth-root 8)
(fifth-root 9)
(fifth-root 10)
(fifth-root 16)
(fifth-root 243)
(newline)

(define (sixth-root x)
  (fixed-point (average-damp (average-damp (average-damp (average-damp (lambda (y) (/ x (* y y (cube y)))))))) 1.0))

(display "sixth")
(newline)
(sixth-root 8)
(sixth-root 9)
(sixth-root 10)
(sixth-root 16)
(sixth-root 972)
(newline)

#|
2 -> 1
3 -> 1
4 -> 2
5 -> 3
6 -> 4
|#


(define (compose p g)
  (lambda (x) (p (g x))))


(define (repeated p n)
  (lambda (x) (if (= n 1)
                  (p x)
                  ((compose p (repeated p (- n 1))) x))))

(define (nt a n)
  (if (= n 0)
      1
      (* a (nt a (- n 1)))))

(define (roots n)
  (cond ((< n 4)
         (lambda (x)
           (fixed-point ((repeated average-damp 1) (lambda (y) (/ x (nt y (- n 1))))) 1.0)))
        (else (lambda (x)
           (fixed-point ((repeated average-damp (- n 2)) (lambda (y) (/ x (nt y (- n 1))))) 1.0)))))

((roots 1) 3)
((roots 2) 9)
((roots 3) 27)
((roots 4) 81)
((roots 5) 243)
((roots 6) 972)