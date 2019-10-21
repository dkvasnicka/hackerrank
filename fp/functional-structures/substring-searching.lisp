(defparameter *case-count*
  (parse-integer (read-line)))

(defun proper-prefixes (s)
  (reduce (lambda (acc x)
            (cons
              (concatenate 'string (car acc) (list x))
              acc))
          (subseq s 0 (- (length s) 1))
          :initial-value '()))

(defun do-proper-suffixes (s)
  (if (null s)
      '()
      (cons s (do-proper-suffixes (cdr s)))))

(defun proper-suffixes (s)
  (do-proper-suffixes (cdr (coerce s 'list))))

(defun partial-match-table (s)
  )

(defun substring? (s1 s2)
  "NO")

(defun main ()
  (loop for i from 1 upto *case-count*
        do (format t "~a~c"
                   (substring? (read-line) (read-line))
                   #\newline)))
