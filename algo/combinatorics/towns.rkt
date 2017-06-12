#lang racket

(let ([_ (read-line)])
  (for ([tc (in-slice 2 (in-lines))])
       (displayln
         (modulo
           (sequence-fold * 1 
                          (in-port read 
                                   (open-input-string (cadr tc))))
           1234567)))) 
