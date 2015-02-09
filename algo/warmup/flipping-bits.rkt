#lang racket

(define [in-bits n [idx 0]]
  (let-values [[(q r) (quotient/remainder n 2)]]
              (if (zero? q)
                (sequence->stream (cons r (make-list (- 31 idx) 0)))
                (stream-cons r (in-bits q (add1 idx))))))

(define [bitflip n]
  (for/sum [[invbit (sequence-map (lambda [b] (if (zero? b) 1 0)) 
                                  (in-bits n))]
            [ex (in-naturals)]]
    (* (expt 2 ex) invbit)))

(for [[n (sequence-tail (in-port) 1)]]
     (displayln (bitflip n)))
