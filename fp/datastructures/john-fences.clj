(defn consume-stack [heights state idx v]
  (loop [s (:stack state) mx 0]
        (if (>= v (nth heights (first s)))
          [s mx]
          (let [[x & xs] s]
            (recur xs
                   (max mx (* (nth heights x)
                              (- idx (first xs) 1))))))))

(defn reducer [heights state idx v]
  (let [[newstack mx] (consume-stack heights state idx v)]
    {:max   (max mx (:max state))
     :stack (cons idx newstack)}))

(defn find-area [heights]
  (:max
    (reduce-kv (partial reducer heights) 
               {:max 0 :stack '(0)} 
               heights)))

(let [len     (read)
      heights (into [] (concat '(-1) (repeatedly len read) '(-1)))]
  (println (find-area heights)))
