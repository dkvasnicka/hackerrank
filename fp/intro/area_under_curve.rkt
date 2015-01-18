#lang racket

(require racket/match)

(define [getf as bs]
  (λ [x] (for/sum [[a as] [b bs]] (* a (expt x b)))))

(define [read-data]
  (map (compose (curry map string->number) 
                (curryr string-split " ")
                string-trim) 
       (port->lines)))

(match-let* [[(list as bs bounds) (read-data)]
             [(list L R) bounds]
             [f (getf as bs)]
             [n 0.001]]
            (displayln
              (for/sum [[x (in-range L R n)]]
                       (* n (f x)))))

