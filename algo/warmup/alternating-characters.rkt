#lang racket

(define [count-deletions l]
  (for/fold ([d 0]
             [ref (car l)])
            ([ch (cdr l)])
    (let ([same? (eq? ch ref)])        
     (values
       (+ d (if same? 1 0))
       (if same? ref ch)))))

(for ([l (sequence-tail (in-lines) 1)])
  (displayln 
    (let-values ([(deletions _) (count-deletions (string->list l))]) 
      deletions)))
