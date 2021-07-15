#lang racket

(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2))
     tolerance))

(define (iterative-improve close-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (lambda (guess) (try guess)))

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

(newline)

(define (n-roots n)
  (cond ((< n 4)
         (lambda (x)
           ((iterative-improve close-enough? ((repeated average-damp 1) (lambda (y) (/ x (nt y (- n 1)))))) 1.0)))
        (else (lambda (x)
           ((iterative-improve close-enough? ((repeated average-damp (- n 2)) (lambda (y) (/ x (nt y (- n 1)))))) 1.0)))))

((n-roots 1) 3)
((n-roots 2) 9)
((n-roots 3) 27)
((n-roots 4) 81)
((n-roots 5) 243)
((n-roots 6) 972)




                   
