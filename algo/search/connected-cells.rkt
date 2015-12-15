#lang racket

(require math/array)

(define (neighbours cur m n)
  (for*/fold ([out '()])
             ([ix '(-1 0 1)] 
              [iy '(-1 0 1)]
              #:unless (= ix iy 0))
    (let ([newx (+ ix (vector-ref cur 0))] 
          [newy (+ iy (vector-ref cur 1))])
      (if (and (< -1 newx m) (< -1 newy n))
        (cons (vector newx newy) out)
        out))))

(let* ([m (read)]
       [n (read)]
       [grid (for/array #:shape (vector m n) ([v (in-port)]) v)])
  (for*/fold ([largest 0])
             ([x m] 
              [y n] 
              #:when (= 1 (array-ref grid (vector x y))))
    (max largest
         (let loop ([current (vector x y)])
           (array-set! grid current 2) 
           (+ 1
              (for/sum ([nbr (neighbours current m n)]
                        #:when (= 1 (array-ref grid nbr)))
                (loop nbr)))))))
