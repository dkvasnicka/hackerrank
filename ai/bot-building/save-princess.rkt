#lang racket

(define (find-princess shape)
  (for/first ([ch (sequence-filter 
                    (compose not char-whitespace?) 
                    (in-port read-char))]
              [i (in-naturals)]
              #:when (eq? ch #\p))
             (call-with-values
               (lambda () (quotient/remainder i shape))
               list)))

(define (project dist dirmapping)
  (for ([i (in-range (abs dist))]
        [move (in-cycle 
                (in-value 
                  (hash-ref dirmapping (positive? dist))))])
    (displayln move)))

(let* ([shape (read)]
       [center (quotient shape 2)]
       [p (find-princess shape)]
       [m (list center center)]
       [distances (map - p m)])
  (for ([d distances]
        [dmap (list
                (hasheq #t "DOWN" #f "UP")
                (hasheq #t "RIGHT" #f "LEFT"))])
    (project d dmap))) 
