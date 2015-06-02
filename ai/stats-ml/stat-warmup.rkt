#lang racket

(require math/statistics)

(define (histogram lst)
  (let ([h (make-hasheq)])
    (for ([i lst])
      (hash-update! h i add1 0))
    h))

(define (mode hist)
  (car
    (for/fold ([acc '(+inf.0 . -inf.0)])
              ([entry (in-hash-pairs hist)])
      (cond
        [(> (cdr entry) (cdr acc)) entry]
        [(= (cdr entry) (cdr acc)) (argmin car (list acc entry))]
        [else acc]))))

(define (sorted-median lst len)
  (let ([middle (quotient len 2)])
   (if (odd? len)
     (list-ref lst middle)
     (mean (take (list-tail lst (sub1 middle)) 2)))))

(define (confidence-int dmean sd size operator)
  (operator dmean (* 1.96 (/ sd (sqrt size)))))

(let* ([len (read)]
       [data (sort (build-list len (lambda (_) (read))) <)]
       [data-mean (exact->inexact (mean data))]
       [data-stddev (stddev data)])
  (displayln data-mean)
  (displayln (exact->inexact (sorted-median data len)))
  (displayln (mode (histogram data)))
  (displayln data-stddev)
  (displayln (string-join 
               (map 
                 (compose ~a (curry confidence-int data-mean data-stddev len)) 
                 (list - +)))))
