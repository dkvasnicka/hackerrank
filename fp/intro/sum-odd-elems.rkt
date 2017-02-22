#lang racket

(for/sum ([n (in-port)]
          #:when (odd? n))
         n)
