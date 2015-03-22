#lang racket

(define (max-subary-sum ary)
  (let loop ([mx -inf.0]
             [sum 0]
             [a ary])
    (if (null? a)
      mx
      (let ([pmax (+ (car a) sum)])
        (loop (if (> pmax mx) pmax mx)
              (if (> pmax 0) pmax 0)
              (cdr a))))))

(define (max-nonctg-sum ary)
  (let-values 
    ([(mx sum all-negative?)
      (for/fold ([mx (inexact->exact -10e5)]
                 [sum 0]
                 [all-negative? #t])
                ([i ary])
                (values
                  (max mx i)
                  (if (positive? i) (+ sum i) sum)
                  (and all-negative? (negative? i))))])
     (if all-negative? mx sum)))

(let ([cases (read)])
  (for ([_ (range cases)])
    (let* ([size (read)]
           [ary (build-list size (lambda (_) (read)))])
      (display (max-subary-sum ary))
      (display " ")
      (displayln (max-nonctg-sum ary)))))
