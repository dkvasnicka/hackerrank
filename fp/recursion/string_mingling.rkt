#lang racket

(let [[p (read-line)]
      [q (read-line)]]
  (displayln
    (string-join
      (sequence->list
        (sequence-map 
          string 
          (in-parallel
            (in-string p)
            (in-string q))))
      "")))
