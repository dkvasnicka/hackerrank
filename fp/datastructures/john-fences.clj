(set! *unchecked-math* true)

(defn traverse-rest [^long car cdr]
  (loop [min-height car
         area       0
         width      2
         fence      cdr]
        (if (empty? fence)
          area
          (let [^long m (min min-height (first fence))]
            (recur m (max area (* width m)) (inc width) (rest fence))))))

(defn find-area [fence]
  (loop [f   fence
         out 0]
        (if (empty? f)
          out
          (let [rst (rest f)]
            (recur rst 
                   (max out 
                        (traverse-rest 
                          (first f) 
                          rst)))))))

(let [len   (read)
      fence (repeatedly len read)]
  (time (println (find-area fence)))) ; 110768
