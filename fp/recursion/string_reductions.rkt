#lang racket/base

(require racket/stream
         racket/set)

(let loop [[chars (sequence->stream (in-port read-char))]
           [uniq (set)]]
  (when (not (stream-empty? chars))
    (loop (stream-rest chars)
          (let [[new (stream-first chars)]]
            (if (set-member? uniq new)
              uniq
              (begin
                (display new)
                (set-add uniq new)))))))
