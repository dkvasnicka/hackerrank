(defn birthdayCakeCandles [ar]
  (first
    (reduce
      (fn [[cnt current-max] i]
        (cond
          (> i current-max) [1 i]
          (= i current-max) [(inc cnt) current-max]
          :else [cnt current-max]))
      [1 (Integer/MIN_VALUE)]
      ar)))

(def ar-count (Integer/parseInt (clojure.string/trim (read-line))))
(def ar (vec (map #(Integer/parseInt %) (clojure.string/split (read-line) #" "))))

(println (birthdayCakeCandles ar))
