#lang typed/racket/base

(require racket/flonum)

(let [[size (* (cast (read) Integer) 
               (cast (read) Integer))]]
       (let: loop : Float [[popped : Integer 0]]
             (if (= popped size)
               (->fl size)
               (+ (/ popped (- size popped)) (loop (add1 popped))))))
