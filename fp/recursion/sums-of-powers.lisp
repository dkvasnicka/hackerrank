(defun power-sum (x n &optional (c 1))
  (let ((pwr (expt c n)))
    (cond
      ((> pwr x) 0)
      ((= pwr x) 1)
      ((< pwr x)
       (+ (power-sum x n (1+ c))
          (power-sum (- x pwr) n (1+ c)))))))

(princ (power-sum (read) (read)))
