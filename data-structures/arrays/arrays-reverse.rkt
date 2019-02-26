#lang racket

(define _ (read-line))

(displayln
    (foldl (lambda (x y) (string-append (number->string x) " " y)) 
           "" 
           (port->list)))
