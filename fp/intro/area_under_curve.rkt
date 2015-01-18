#lang racket

(require racket/match)

(define [getf as bs]
  (lambda [x] (for/sum [[a as] [b bs]] (* a (expt x b)))))

(define [read-data]
  (map (compose (curry map string->number) 
                (curryr string-split " ")
                string-trim) 
       (port->lines)))

(match-let* [[(list as bs bounds) (read-data)]
             [(list L R) bounds]
             [f (getf as bs)]
             [n 0.001]]
            (for/fold [[area 0]
                       [volume 0]]
                      [[x (in-range L R n)]]
              (let [[v (f x)]]
               (values
                 (+ area (* n v))
                 (+ volume (* pi n (expt v 2)))))))
