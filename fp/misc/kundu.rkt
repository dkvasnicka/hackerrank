#lang typed/racket

(require racket/flonum)

(let [[size (* (cast (read) Integer) 
               (cast (read) Integer))]]
       (let: loop : Float [[popped : Integer 0]
                           [out : Float (->fl size)]]
             (if (= popped size)
               out
               (loop (add1 popped)
                     (+ out (/ popped (- size popped)))))))
