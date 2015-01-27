#lang racket/base

(let [[_ (read-line)]]
  (for [[l (in-lines)]]
       (displayln
         (build-string
           (string-length l)
           (lambda [i] 
             (string-ref l
                         (+ i (if (even? (add1 i)) -1 1))))))))
