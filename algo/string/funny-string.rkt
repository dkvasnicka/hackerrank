#lang racket

(define (charseq)
  (sequence->stream
    (sequence-map
      char->integer
      (stop-before (in-port read-char)
                   (curry eq? #\newline)))))

(define (subtractions s)
  (let loop ([out '()]
             [len 0]
             [subtractee (stream-first s)]
             [strm (stream-rest s)])
    (if (stream-empty? strm)
      (values out len)
      (loop (cons (abs (- (stream-first strm) subtractee)) out)
            (add1 len)
            (stream-first strm)
            (stream-rest strm)))))

(for ([_ (in-range (string->number (read-line)))])
  (let*-values ([(subs len) (subtractions (charseq))]
                [(L R) (split-at subs (floor (/ len 2)))])
    (displayln
      (if (equal? (reverse L) ((if (odd? len) cdr identity) R))
        "Funny"
        "Not Funny"))))
