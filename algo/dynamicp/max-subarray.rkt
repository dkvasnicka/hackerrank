#lang racket

(require racket/unsafe/ops)

(define (intermediate-sums ary)
  (let loop ([xs ary]
             [i 0])
    (if (null? xs)
      empty-stream
      (let ([v (unsafe-fx+ i (car xs))])
        (stream-cons v (loop (cdr xs) v))))))

(define (stream-max s)
  (stream-fold unsafe-fxmax (stream-first s) (stream-rest s)))

(define (max-subary-sum ary)
  (inexact->exact
    (let loop ([mx -inf.0]
               [subary ary])
      (if (null? subary)
        mx
        (loop (max mx (stream-max (intermediate-sums subary)))
              (cdr subary))))))

(define (max-nonctg-sum ary)
  (let-values 
    ([(mx sum all-negative?)
      (for/fold ([mx (inexact->exact -10e5)]
                 [sum 0]
                 [all-negative? #t])
                ([i ary])
                (values
                  (unsafe-fxmax mx i)
                  (if (positive? i) (unsafe-fx+ sum i) sum)
                  (and all-negative? (negative? i))))])
     (if all-negative? mx sum)))

(let ([cases (read)])
  (for ([_ (range cases)])
    (let* ([size (read)]
           [ary (build-list size (lambda (_) (read)))])
      (display (max-subary-sum ary))
      (display " ")
      (displayln (max-nonctg-sum ary)))))
