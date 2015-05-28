#lang racket

(require rnrs/io/ports-6)

(define (load-data)
  (sequence-map
    (lambda (l)
      (for/vector ([n (string-split l ",")])
                  (string->number n)))
    (in-lines (open-file-input-port "trainingdata.txt"))))

(displayln
  (let ([x (read)])
   (if (< x 4)
     (* 2 x)
     8.00)))
