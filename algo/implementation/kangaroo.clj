(require '[clojure.java.io :as io])

(defn kangaroo [x1 v1 x2 v2]
  (if (= v1 v2)
    "NO"
    (let [intersect-x (/ (- x1 x2) (- v2 v1))]
      (if (and (integer? intersect-x) (pos? intersect-x))
        "YES"
        "NO"))))

(doseq [l (line-seq (io/reader *in*))]
  (let [input (map #(Integer/parseInt (clojure.string/trim %))
                   (clojure.string/split l #" "))]
    (println (apply kangaroo input))))
