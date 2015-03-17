#lang racket

(match-let ([(list a b) (map 
                          (compose string->number (curry string-append "#b")) 
                          (port->lines))])
  (modulo
    (for/sum ([i (in-range 314160)])
      (bitwise-xor a (arithmetic-shift b i)))
    (+ (expt 10 9) 7)))
