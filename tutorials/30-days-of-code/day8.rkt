#lang racket

(define (build-phonebook) 
  (for/hash ([i (range (string->number (read-line)))]
             [l (in-producer read-line)])
    (apply values (string-split l))))

(let ([phonebook (build-phonebook)])
  (for ([query (in-lines)])
    (displayln
      (let ([maybe-phone (hash-ref phonebook query #f)])
        (if maybe-phone
          (format "~a=~a" query maybe-phone)
          "Not found")))))
