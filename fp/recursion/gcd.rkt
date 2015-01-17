#lang racket

; https://www.hackerrank.com/challenges/functional-programming-warmups-in-recursion---gcd

(define [gcd x y]
  (if (= x y)
    x
    (gcd (abs (- x y)) (min x y))))

(displayln
  (gcd (read) (read)))
