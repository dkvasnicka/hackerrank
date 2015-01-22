#lang typed/racket

(let [[size (* (cast (read) Integer) 
               (cast (read) Integer))]]
  (exact->inexact
    (+ size
       (let: loop : Float [[popped : Integer 0]
                           [out : Float 0.0]]
             (if (= popped size)
               out
               (loop (add1 popped)
                     (+ out (/ popped (- size popped)))))))))
