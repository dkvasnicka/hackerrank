#lang racket

(require racket/match)

(define (find-princess shape)
  (for/first ([ch (sequence-filter 
                    (compose not char-whitespace?) 
                    (in-port read-char))]
              [i (in-naturals)]
              #:when (eq? ch #\p))
             (call-with-values
               (lambda () (quotient/remainder i shape))
               list)))

(let* ([shape (read)]
       [m (list (read) (read))]
       [p (find-princess shape)]
       [distances (map - p m)])
  (displayln
    (match distances
      [(list (? positive?) _) "DOWN"]
      [(list (? negative?) _) "UP"]
      [(list 0 (? positive?)) "RIGHT"] 
      [(list 0 (? negative?)) "LEFT"])))    
