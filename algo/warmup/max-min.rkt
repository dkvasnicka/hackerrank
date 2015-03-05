#lang racket/base

(require racket/fixnum
         racket/port)

(let ([len (read)]
      [size (read)]
      [nums (sort (port->list) <)])
  (let loop ([unfairness (fl->fx 10e10)]
             [rem nums]
             [cnt len])
    (if (< cnt size)
      unfairness
      (loop (min unfairness (- (list-ref rem (- size 1)) 
                               (car rem)))
            (cdr rem)
            (sub1 cnt)))))
