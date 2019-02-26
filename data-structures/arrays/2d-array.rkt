#lang typed/racket

(require math/array)

(define (load-input)
  (for/array #:shape (vector 6 6) 
             ([v (in-port)]) : Integer 
    (cast v Integer)))

(let ([grid (load-input)])
  grid)
