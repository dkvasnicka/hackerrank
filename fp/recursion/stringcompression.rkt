#lang racket

(require srfi/41)

(define [append-compressed out ch counter]
  (string-append out 
    (string-append (string ch) 
      (if (> counter 1) (number->string counter) ""))))

(define [loop curr rest out counter]
  (if (stream-null? rest)
      (append-compressed out curr counter)
      (let [[new (stream-car rest)]
            [tail (stream-cdr rest)]]
        (loop new
              tail
              (if (char=? curr new) 
                  out
                  (append-compressed out curr counter))
              (if (char=? curr new) (add1 counter) 1)))))

(let [[chars (port->stream)]]
  (displayln 
    (loop (stream-car chars) (stream-cdr chars) "" 1)))
