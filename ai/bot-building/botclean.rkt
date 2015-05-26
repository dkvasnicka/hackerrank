#lang racket

(require racket/match)

(define (euclid-distance a b)
  (sqrt 
    (for/sum ([i (map - a b)]) 
      (expt i 2))))

(define (find-closest-garbage bot)
  (for/fold ([closest '(+inf.0 +inf.0 +inf.0)]) 
            ([ch (sequence-filter (compose not char-whitespace?) 
                                  (in-port read-char))]
             [i (in-naturals)]
             #:when (eq? ch #\d))             
    (let*-values ([(y x) (quotient/remainder i 5)]
                  [(coords) (list y x)])
      (argmin car 
              (list closest 
                    (cons (euclid-distance bot coords) coords))))))

(let* ([bot (list (read) (read))]
       [garbage (find-closest-garbage bot)]
       [distances (map - (cdr garbage) bot)])
  (displayln
    (match distances
      [(list 0 0)             "CLEAN"]
      [(list (? positive?) _) "DOWN"]
      [(list (? negative?) _) "UP"]
      [(list 0 (? positive?)) "RIGHT"] 
      [(list 0 (? negative?)) "LEFT"])))
