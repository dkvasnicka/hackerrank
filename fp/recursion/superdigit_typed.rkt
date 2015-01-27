#lang typed/racket/base

(: digit-sum (Integer -> Integer))

(define [digit-sum num]
  (if (< num 10)
    num
    (let-values [[(q r) (quotient/remainder num 10)]]
                (+ r (digit-sum q)))))

(: super-digit (Integer -> Integer))

(define [super-digit n]
  (if (< n 10)
    n
    (super-digit (digit-sum n))))

(let* [[n (cast (read) Integer)]
       [k (cast (read) Integer)]
       [init (* k (digit-sum n))]]
  (super-digit init))
