#lang racket
; Solved on an iPad

(require unstable/sequence)

(for ((nums (in-slice 2 (sequence-tail (in-port) 1))))
     (displayln (foldl + 0 nums)))