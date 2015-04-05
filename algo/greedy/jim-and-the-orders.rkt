#lang racket

(require data/splay-tree)

(define _ (read))

(define (load-data)
  (let loop ([t (make-adjustable-splay-tree)]
             [i 1]
             [k (read)]
             [v (read)])
    (if (eof-object? k)
      t
      (let ([tkey (+ k v)])        
        (dict-set! t tkey 
                   (string-append 
                     (dict-ref t tkey "")
                     (number->string i)
                     " "))
        (loop t (add1 i) (read) (read))))))

(for ([x (in-dict-values (load-data))])
  (display x))
