
(let [L (read) S1 (read) S2 (read)]
  (dotimes [x (read)]
    (let [area (read)
          full-diag (Math/sqrt (* 2 L L))
          diag-overlap (Math/sqrt (* 2 area))]
      (println
        (/ (- full-diag diag-overlap) (Math/abs (- S2 S1)))))))
