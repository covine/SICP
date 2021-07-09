#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(gcd 206 40)

#| normal-order evaluation |#
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
    
    






#| applicative-order evaluation 4|#
(gcd 40 (remainder 206 40))
(gcd 6 (remainder 40 6))
(gcd 4 (remainder 6 4))
(gcd 2 (remainder 4 2))