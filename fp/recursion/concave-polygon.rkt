#lang racket

(struct pt (x y) #:transparent)

(define (line->pt l)
  (apply pt (map string->number (string-split l))))

(define (bottomleft? p1 p2) 
  (or (< (pt-y p1) (pt-y p2))
      (and (= (pt-y p1) (pt-y p2))
           (< (pt-x p1) (pt-x p2)))))

(define (read-points)
  (for/fold ([bl (line->pt (read-line))]
             [pts '()])
            ([nextpt (sequence-map line->pt (in-lines))])
    (if (bottomleft? nextpt bl)
      (values nextpt (cons bl pts))
      (values bl (cons nextpt pts)))))

(define (line-angle p q)
  (atan (- (pt-y q) (pt-y p))
        (- (pt-x q) (pt-x p))))

(define (z-coord p q r)
  (- (* (- (pt-x q) (pt-x p))
        (- (pt-y r) (pt-y p)))
     (* (- (pt-y q) (pt-y p))
        (- (pt-x r) (pt-x p)))))

(define _ (read-line))
(displayln
  (let*-values ([(bottomleft points) (read-points)]
                [(startingset) (sort points < #:key 
                                     (curry line-angle 
                                            bottomleft))]) 
    (let loop ([candidates (cddr startingset)]
               [stack (list (cadr startingset) 
                            (car startingset) 
                            bottomleft)])
      (if (empty? candidates)
        "NO"
        (if (negative? (z-coord (cadr stack) (car stack) (car candidates)))
          "YES"
          (loop (cdr candidates) (cons (car candidates) stack)))))))
