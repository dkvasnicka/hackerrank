#lang typed/racket

(define cnt (read))

(for ([n (cast (in-port) (Sequenceof Integer))])
     (displayln
       (if (= n 1)
         1
         (+ (+ 5 (* 5 (- n 2)))
            (for/sum : Integer ([x (in-range 0 (- n 2))])
                               (+ 2 (* 3 x)))))))
