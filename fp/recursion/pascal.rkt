#lang racket

(require math/number-theory)

(define [position-value n r]
  (/ (factorial n) (* (factorial r) (factorial (- n r)))))

(let [[K (read)]]
  (let loop [[x 0]]
    (when (< x K)
      (displayln
        (string-join 
          (map (compose 
                 number->string 
                 (curry position-value x)) 
               (range (add1 x))) 
          " "))
      (loop (add1 x)))))
