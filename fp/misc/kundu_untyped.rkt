#lang racket

(require racket/flonum)

(let [[size (->fl (* (read) (read)))]]
  (sequence-fold (lambda [accum popped] (fl+ accum (fl/ popped (fl- size popped))))
                 size
                 (sequence-map ->fl (in-range size))))
