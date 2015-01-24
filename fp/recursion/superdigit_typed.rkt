#lang typed/racket

(: digit-sum (Integer Integer -> Integer))

(define [digit-sum num out]
  (if (< num 10)
    (+ out num)
    (let-values [[(q r) (quotient/remainder num 10)]]
                (digit-sum q (+ out r)))))

(: super-digit (Integer -> Integer))

(define [super-digit n]
  (if (< n 10)
    n
    (super-digit (digit-sum n 0))))

(let* [[n (cast (read) Integer)]
       [k (cast (read) Integer)]
       [init (* k (digit-sum n 0))]]
  (super-digit init))
