#lang racket

(require math/array)

(define (parse-map shape)
  (for/array 
    #:shape shape
    ([ch (sequence-filter (compose not char-whitespace?) (in-port read-char))]) 
        (string->number (string ch))))

(define (cavity? elm idxs cmap)
  (sequence-andmap (curry > elm) 
    (sequence-map (curry array-ref cmap)
         (sequence-map 
           (curry vector-map + idxs) 
           (list #[-1 0] #[1 0] #[0 -1] #[0 1])))))

(let* ([n (read)]
       [shape (vector n n)]
       [cmap (parse-map shape)]
       [lastidx (sub1 n)])
  (for ([elm (in-array cmap)]
        [idxs (in-array-indexes shape)])
    (match idxs
      [(vector _ (? (curry = lastidx))) (displayln elm)]
      [(or (vector 0 _) (vector _ 0) (vector (? (curry = lastidx)) _)) (display elm)]
      [_ (display
           (if (cavity? elm idxs cmap) 
             "X"
             elm))])))
