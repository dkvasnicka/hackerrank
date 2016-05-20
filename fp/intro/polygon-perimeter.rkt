#lang racket

(define ptscnt (read-line))
(define data
  (for/list ([l (in-lines)])
    (map string->number 
         (string-split 
           (string-trim l)))))

(define (euclidean-dist p q)
  (sqrt (+ (sqr (- (car p) (car q))) 
           (sqr (- (cadr p) (cadr q))))))

(let loop ([pts data])
  (if (null? (cdr pts))
    (euclidean-dist (car pts) (car data))
    (+ (euclidean-dist (car pts) (cadr pts))
       (loop (cdr pts)))))
