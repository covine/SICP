#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
#| if b is a positive number, calculate the value of a plus b.
Otherwise, get the value of a minus b. |#
(a-plus-abs-b 1 1)
(a-plus-abs-b 1 -1)
