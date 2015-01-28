#lang racket

(require racket/unsafe/ops)

(define + unsafe-fx+)
(define - unsafe-fx-)
(define * unsafe-fx*)

(for [[n (sequence-tail (in-port) 1)]]
     (displayln
       (if (= n 1)
         1
         (+ (+ 5 (* 5 (- n 2)))
            (for/sum [[x (in-range 0 (- n 2))]]
                     (+ 2 (* 3 x)))))))
