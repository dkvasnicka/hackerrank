#lang racket

(require unstable/sequence)

(define _ (read-line))
(define data 
  (sequence->stream 
    (in-slice 2 (in-port))))

(let loop ([points (stream-append data (stream (stream-first data)))])
  (if (stream-empty? (stream-rest points))
    0
    (let* ([tail (stream-rest points)]
           [p (stream-first points)]
           [q (stream-first tail)])
      (+ (sqrt (+ (abs (- (car p) (car q))) 
                  (abs (- (cadr p) (cadr q)))))
         (loop tail)))))
