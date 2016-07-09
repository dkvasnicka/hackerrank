#lang racket

(define (parse l)
  (map string->number 
       (string-split 
         (string-trim l))))

(define ptscnt (read-line))
(define A (parse (read-line)))

(define (comp-det x y)
  (- (* (car x) (cadr y))
     (* (cadr x) (car y))))

(define (loop curr next-line)
  (if (eof-object? next-line)
    (comp-det curr A)
    (let ([nline (parse next-line)])
      (+ (comp-det curr nline)
         (loop nline (read-line))))))

(exact->inexact
  (abs (/ (loop A (read-line)) 2)))
