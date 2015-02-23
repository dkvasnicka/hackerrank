#lang racket

(let ([L (read)]
      [R (read)])
  (for*/fold ([mx 0])
             ([A (in-range L (add1 R))]
              [B (in-range A (add1 R))])
             (max mx (bitwise-xor A B))))
