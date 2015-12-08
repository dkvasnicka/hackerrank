#lang racket

(for ([_ (in-range (read))])
  (let* ([N (read)]
         [C (read)]
         [M (read)]
         [initchoc (quotient N C)])
    (displayln
      (+ initchoc
         (let loop ([i initchoc] [acc 0])
           (if (< i M)
             acc
             (loop (add1 (- i M)) (add1 acc))))))))
