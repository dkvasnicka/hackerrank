#lang racket

(require srfi/14)

(let ([sentence-charset (string->char-set (string-downcase (read-line)))])
  (displayln
    (if (char-set= (char-set-difference 
                     (apply char-set (map integer->char (range 97 123))) 
                     sentence-charset) 
                   char-set:empty)
      "pangram"
      "not pangram")))
