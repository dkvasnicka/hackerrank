#lang racket

(define limit (read))

(for ([n (in-port)]
      #:when (< n limit))
     (displayln n))
