#lang racket

(require math/array
         srfi/43)

(define (mark-edge G e re state)
  (array-set! G e state) 
  (array-set! G re state))

(define (build-graph size edges)
  (let ([G (array->mutable-array (make-array (vector size size) #f))])
    (for ([(e re) edges]) 
      (mark-edge G e re #t)) 
    G))

(define (tree-size G root excl)
  (for/sum ([idx (in-naturals)]
            [node (in-array (array-axis-ref G 0 root))]
            #:when (and (not (= idx excl)) node))
    (add1 (tree-size G idx root))))

(define (stream-of-edges)
  (sequence->stream 
    (sequence-map 
      (compose
        (lambda (e) (values 
                      (list->vector e) 
                      (reverse-list->vector e)))
        (curry map sub1)) 
      (in-slice 2 (in-port)))))

(define (both-subtrees-even? G e re)
  (for/and ([x e]
            [y re]) 
    (even? (add1 (tree-size G x y)))))

(let* ([N (read)]
       [M (read)]
       [edges (stream-of-edges)]
       [G (build-graph N edges)])
  (for/sum ([(e re) edges] 
            #:when (both-subtrees-even? G e re))
    (mark-edge G e re #f)
    1))
