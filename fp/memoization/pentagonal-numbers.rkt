#lang racket

(define cnt (read))

(define (pentagonal-stream i prev)
  (let ([p (+ prev (* 2 i) (- i 2))])
    (stream-cons (list i p) (pentagonal-stream (add1 i) p))))

(define pentagonals
  (stream-cons '(1 1) (pentagonal-stream 2 1)))

(for ([n (in-port)]
      [ps pentagonals])
  (displayln 
    (if (= n (car ps))
      (cadr ps)
      (cadr (stream-ref pentagonals (sub1 n))))))
