#lang racket

(let ([size (read)])
  (abs
    (for*/sum ([x (in-range size)]
               [y (in-range size)])
              (let ([v (read)])
               (+
                 (if (= x y) v 0)
                 (if (= (+ x y) (sub1 size)) (- v) 0))))))
