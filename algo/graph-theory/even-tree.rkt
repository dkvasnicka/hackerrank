#lang racket

(require unstable/sequence)

(define (build-graph size edges)
  (let ([G (make-vector (add1 size) (seteq))])
    (for ([(a b) edges])
      (vector-set! G b (set-add (vector-ref G b) a)))
    G))

(define (tree-size G in)
  (+ (set-count in)
     (for/sum ([node in])
       (tree-size G (vector-ref G node)))))

(let* ([N (read)]
       [M (read)]
       [edges (sequence->stream 
                (sequence-map 
                  (curry apply values) 
                  (in-slice 2 (in-port))))]
       [G (build-graph N edges)])
  (for/sum ([(a b) edges] 
            #:when (andmap (compose even? add1 (curry tree-size G))
                           (list
                             (vector-ref G a)
                             (set-remove (vector-ref G b) a))))
    (vector-set! G b (set-remove (vector-ref G b) a))
    1))

