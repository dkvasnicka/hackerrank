#lang racket

(require math/array)

(let* ([text (read-line)]
       [lensq (sqrt (string-length text))]
       [rows (inexact->exact (round lensq))]
       [cols (inexact->exact (ceiling lensq))]
       [ary (for/array #:shape (vector rows cols) #:fill #\space 
                       ([ch text]) ch)])
  (displayln
    (string-join
      (for/list ([col (in-array-axis ary 1)])
        (string-trim (apply string (array->list col))))
      " ")))
