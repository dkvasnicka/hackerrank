#lang racket

(require racket/unsafe/ops)

(define [digit-sum num [out 0]]
  (if (unsafe-fx< num 10)
    (unsafe-fx+ out num)
    (let-values [[(q r) (quotient/remainder num 10)]]
                (digit-sum q (unsafe-fx+ out r)))))

(define [super-digit n]
  (if (unsafe-fx< n 10)
    n
    (super-digit (digit-sum n))))

(let* [[n (read)]
       [k (read)]
       [init (unsafe-fx* k (digit-sum n))]]
  (super-digit init))
