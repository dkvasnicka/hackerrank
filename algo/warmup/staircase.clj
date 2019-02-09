(defn staircase [n]
  (let [fmt (str "%" n "s")]
    (doseq [i (range 1 (inc n))]
      (println
        (format fmt (apply str (repeat i "#")))))))

(def n (Integer/parseInt (clojure.string/trim (read-line))))
(staircase n)
