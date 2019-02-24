(require '[clojure.java.io :as io])

(defn update-accumulator [acc x]
  (cond
    (empty? acc)             [x]
    (<= (- x (first acc)) 1) (conj acc x)
    :else                    [x]))

(doseq [l (take-nth 2 (rest (line-seq (io/reader *in*))))]
  (let [nums (sort (map #(Integer/parseInt %) (clojure.string/split l #" ")))]
    (println
      (loop [[x & xs] nums acc [] mx 0]
        (if (nil? x)
          mx
          (let [new-acc (update-accumulator acc x)]
            (recur xs
                   new-acc
                   (max mx (count new-acc)))))))))
