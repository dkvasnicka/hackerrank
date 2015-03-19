#lang racket

(define (max-subary-sum ary)
  0)

(define (max-nonctg-sum ary)
  (call-with-values
    (λ ()
       (for/fold ([mx -10e5]
                  [sum 0]
                  [all-negative? #t])
         ([i ary])
         (values
           (max mx i)
           (if (positive? i) (+ sum i) sum)
           (and all-negative? (negative? i)))))
    (λ (mx sum all-negative?)
       (if all-negative? mx sum))))

(let ([cases (read)])
  (for ([_ (range cases)])
    (let* ([size (read)]
           [ary (build-list size (λ (_) (read)))])
      (display (max-subary-sum ary))
      (display " ")
      (displayln (max-nonctg-sum ary)))))
