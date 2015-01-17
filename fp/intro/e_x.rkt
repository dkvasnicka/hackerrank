#lang racket

(require math/number-theory)

(for [[n (sequence-tail (in-port) 1)]]
     (displayln
       (+ (add1 n)
          (for/sum [[e (in-range 2 10)]]
                   (/ (expt n e) (factorial e))))))
