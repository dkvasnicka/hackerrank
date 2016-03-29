#lang racket

(define (count-groups)
  (for/fold ([counts (hasheq 'pos 0 'neg 0 'zer 0)])
            ([x (in-port)])
    (let ([k (cond
               [(positive? x) 'pos]
               [(negative? x) 'neg]
               [else 'zer])])
      (hash-update counts k add1))))

(define (disp t v)
  (displayln
    (exact->inexact
      (/ v t))))

(let* ([total (read)]
       [groups (count-groups)]
       [d (curry disp total)])
  (d (hash-ref groups 'pos)) 
  (d (hash-ref groups 'neg)) 
  (d (hash-ref groups 'zer)))
