#lang racket

(require math/array
         math/matrix
         2htdp/image
         lang/posn)

;(define _ (read)) ; read away point count

(define (eof? mx)
  (array-ormap eof-object? mx))

(define (point)
  (let ([p (col-matrix [(read) (read)])])
    (if (eof? p) start p)))

(define start null
  ;(point)
  )

(define (compute-angle x y z)
  (matrix-angle (matrix- x y) (matrix- z y)))

(define (traverse x y)
  (if (matrix= y start)
    "NO"
    (let* ([z (point)]
           [a (compute-angle x y z)])
      (if (>= a pi)
        "YES"
        (traverse y z)))))

;(displayln (traverse start (point)))

(polygon
  (for/list ([l (in-lines)])
    (let ([coords (map string->number (string-split l))])
      (make-posn (car coords) (cadr coords))))
  'outline
  "black")
