#lang racket

(define (build-phonebook) 
  (for/hasheq ([i (in-range (read))])
    (values (read) (read))))

(let ([phonebook (build-phonebook)])
  (for ([query (in-port)])
    (displayln
      (let ([maybe-phone (hash-ref phonebook query #f)])
        (if maybe-phone
            (format "~a=~a" query maybe-phone)
            "Not found")))))
