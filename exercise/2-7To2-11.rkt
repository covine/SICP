#lang racket

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

(define (make-interval a b) (cons a b))

#| 2-7 |#
(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

#| 2-8 no cosideration of positive or nagetive? |#
(define (sub-interval x y)
  (let ((p1  (- (lower-bound x) (lower-bound y)))
        (p2  (- (upper-bound x) (upper-bound y))))
    (make-interval p1 p2)))

(lower-bound (sub-interval (make-interval 7 14) (make-interval 1 15)))
(upper-bound (sub-interval (make-interval 7 14) (make-interval 1 15)))

#| 2-9 |#
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2.0))

#| true for add and sub |#
(width (add-interval (make-interval 7 14) (make-interval 1 15)))
(+ (width (make-interval 7 14)) (width (make-interval 1 15)))
(width (sub-interval (make-interval 7 14) (make-interval 1 15)))
(- (width (make-interval 7 14)) (width (make-interval 1 15)))
#| false for mul and div |#
(width (mul-interval (make-interval 7 14) (make-interval 1 15)))
(* (width (make-interval 7 14)) (width (make-interval 1 15)))
(width (div-interval (make-interval 7 14) (make-interval 1 15)))
(/ (width (make-interval 7 14)) (width (make-interval 1 15)))

#| 2-10 |#
(define (new-div-interval x y)
  (if (or (= (upper-bound y) 0) (= (lower-bound y) 0))
      #f
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(new-div-interval (make-interval 7 14) (make-interval 0 15))

#| 2-11 |#
 ; patt |  min  |  max 
 ; ++++ | al bl | ah bh 
 ; ++-+ | ah bl | ah bh 
 ; ++-- | ah bl | al bh 
 ; -+++ | al bh | ah bh 
 ; -+-+ | trouble case 
 ; -+-- | ah bl | al bl 
 ; --++ | al bh | ah bl 
 ; ---+ | al bh | al bl 
 ; ---- | ah bh | al bl 
  
 (define (pos? n) (>= 0)) 
 (define (neg? n) (not (pos? n))) 
  
 (define (new-mul-interval a b) 
   (let ((al (lower-bound a)) 
         (ah (upper-bound a)) 
         (bl (lower-bound b)) 
         (bh (upper-bound b))) 
     (cond ((and (pos? al) (pos? ah) (pos? bl) (pos? bh)) 
            (make-interval (* al bl) (* ah bh))) 
           ((and (pos? al) (pos? ah) (neg? bl) (pos? bh)) 
            (make-interval (* ah bl) (* ah bh))) 
           ((and (pos? al) (pos? ah) (neg? bl) (neg? bh)) 
            (make-interval (* ah bl) (* al bh))) 
           ((and (neg? al) (pos? ah) (pos? bl) (pos? bh)) 
            (make-interval (* al bh) (* ah bh))) 
           ((and (neg? al) (pos? ah) (neg? bl) (neg? bh)) 
            (make-interval (* ah bl) (* al bl))) 
           ((and (neg? al) (neg? ah) (pos? bl) (pos? bh)) 
            (make-interval (* al bh) (* ah bl))) 
           ((and (neg? al) (neg? ah) (neg? bl) (pos? bh)) 
            (make-interval (* al bh) (* al bl))) 
           ((and (neg? al) (neg? ah) (neg? bl) (neg? bh)) 
            (make-interval (* ah bh) (* al bl))) 
           ((and (neg? al) (pos? ah) (neg? bl) (pos? bh)) 
            ; our trouble case 
            (let ((p1 (* al bl)) 
                  (p2 (* al bh)) 
                  (p3 (* ah bl)) 
                  (p4 (* ah bh))) 
              (make-interval (min p1 p2 p3 p4) 
                             (max p1 p2 p3 p4)))))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))



(new-mul-interval (make-interval -7 14) (make-interval -1 15))