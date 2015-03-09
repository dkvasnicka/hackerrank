#lang racket

(define (too-many-absent? arrivs N K)
  (cond
    [(< N K) #t]
    [(null? arrivs) #f]
    [else (too-many-absent? 
            (cdr arrivs)
            (if (> (car arrivs) 0) (sub1 N) N)
            K)]))

(for ([_ (range (read))])
  (let* ([N (read)]
         [K (read)]
         [arriv-times (build-list N (lambda [__] (read)))])
    (displayln
      (if (too-many-absent? arriv-times N K) "YES" "NO"))))
