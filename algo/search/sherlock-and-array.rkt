#lang racket

(require racket/stream)

(define (intermediate-sums seed)
  (let ([a (+ seed (read))])
    (stream-cons a (intermediate-sums a))))

(define (find-equilibrium len nums)
  (let* ([declen (sub1 len)]
         [butlast-sum (vector-ref nums declen)])
        (or
          (for/first ([y (in-producer (lambda () "YES"))]
                      [i (in-range 1 declen)]
                      #:when (= (vector-ref nums (sub1 i)) 
                                (- butlast-sum (vector-ref nums i))))
                     y)
          "NO")))

(for ([_ (read)])
  (let* ([len (read)]
         [nums (for/vector #:length len ([x (intermediate-sums 0)]) x)])
    (displayln
      (case len 
        [(1) "YES"]
        [(2) "NO"]
        [else (find-equilibrium len nums)]))))
