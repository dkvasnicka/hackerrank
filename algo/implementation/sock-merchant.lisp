(defun main ()
  (let* ((n (read))
         (socks (loop for i from 1 to n collect (read)))
         (hist (reduce #'(lambda (acc x) (incf (gethash x acc 0)) acc)
                       socks
                       :initial-value (make-hash-table))))
    (princ (loop for v being the hash-values of hist
                 sum (floor (/ v 2)))))
  (quit))
