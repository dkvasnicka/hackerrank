#lang racket

(define _ (read))

(for ([n (in-port)])
  (displayln
    (/ (- (* 3 (sqr n)) n) 2)))
