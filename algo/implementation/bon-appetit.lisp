(let* ((n (read))
       (refused (read))
       (items (loop for _ from 1 to n collect (read)))
       (charged (read))
       (correct (loop for i in items
                      for idx from 0 to (1- n)
                      when (not (= idx refused))
                      sum i into total
                      finally (return (/ total 2))))
       (diff (- charged correct)))
  (princ
    (if (> diff 0)
        diff
        "Bon Appetit")))
