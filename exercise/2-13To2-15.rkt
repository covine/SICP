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

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

#|
'(3.138562091503269 . 3.538775510204081)
'(3.266666666666667 . 3.3999999999999995)
|#
(par1 (make-center-percent 10 0.02) (make-center-percent 5 0.02))
(par2 (make-center-percent 10 0.02) (make-center-percent 5 0.02))
#|
'(3.2346534653465353 . 3.4346801346801343)
'(3.3 . 3.3666666666666663)
|#
(par1 (make-center-percent 10 0.01) (make-center-percent 5 0.01))
(par2 (make-center-percent 10 0.01) (make-center-percent 5 0.01))

#|
agree with Eva.
......
|#
(par1 (make-center-percent 10 0.2) (make-center-percent 10 0.2))
(par2 (make-center-percent 10 0.2) (make-center-percent 10 0.2))




