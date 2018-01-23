#lang racket

(define (compute-scores A B)
  (for/fold ([scores (hasheq #t 0 #f 0)])
            ([a A] [b B] #:unless (= a b))
    (hash-update scores (> a b) add1)))

(match-let* ([(list A B) (sequence->list 
                           (in-slice 3 (in-port)))]
             [scores (compute-scores A B)])
  (printf "~a ~a" (hash-ref scores #t) (hash-ref scores #f)))
