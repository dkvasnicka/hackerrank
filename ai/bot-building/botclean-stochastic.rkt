#lang racket

(require racket/match)

(define (find-garbage shape)
  (for/first ([ch (sequence-filter 
                    (compose not char-whitespace?) 
                    (in-port read-char))]
              [i (in-naturals)]
              #:when (eq? ch #\d))
             (call-with-values
               (lambda () (quotient/remainder i shape))
               list)))

(let* ([b (list (read) (read))]
       [d (find-garbage 5)]
       [distances (map - d b)])
  (displayln
    (match distances
      [(list 0 0)             "CLEAN"]
      [(list (? positive?) _) "DOWN"]
      [(list (? negative?) _) "UP"]
      [(list 0 (? positive?)) "RIGHT"] 
      [(list 0 (? negative?)) "LEFT"])))    
