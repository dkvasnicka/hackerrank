#lang racket

(let ([V (read)]
      [n (read)])
  (for/last ([num (in-port)]
             [idx (in-naturals)]
             #:final (= V num))
    idx))