#lang racket

(require mzlib/string)

(modulo
  (apply gcd
         (for/list ([nums (sequence-map read-from-string-all (in-lines))]
                    #:unless (null? (cdr nums)))
           (foldl * 1 nums)))
  1000000007)
