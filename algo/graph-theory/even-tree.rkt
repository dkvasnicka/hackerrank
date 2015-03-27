#lang racket

(require unstable/sequence)

(define (build-graph size port-seq)
  (vector->immutable-vector
    (let ([G (make-vector (add1 size) '())])
      (for ([edge (in-slice 2 port-seq)])
        (match-let ([(list a b) edge])
          (vector-set*! G 
                        a (cons b (vector-ref G a))
                        b (cons a (vector-ref G b)))))
      G)))

(let* ([N (read)]
       [M (read)]
       [G (build-graph N (in-port))])
  G)
