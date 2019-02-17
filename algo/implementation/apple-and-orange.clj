(defn count-hits [fruit tree s t]
  (reduce + (map #(if (<= s (+ % tree) t) 1 0) fruit)))

(let [s (read) t (read) a (read) b (read) m (read) n (read)
      apples (repeatedly m read)
      oranges (repeatedly n read)]
  (println (count-hits apples a s t))
  (println (count-hits oranges b s t)))
