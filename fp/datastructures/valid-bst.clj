(require '[clojure.java.io :as io])

(defn worker [[x & xs]]
     (if (nil? x)
       true
       (let [[L R] (split-with (partial > x) xs)]
         (if-not (every? (partial < x) R)
                 false
                 (and (worker L) (worker R))))))

(let [lines (rest (take-nth 2 (line-seq (io/reader *in*))))
      trees (map (comp (partial map #(Integer/parseInt %)) 
                       #(clojure.string/split % #" ")) lines)]
  (doseq [tree trees]
         (println (if (worker tree) "YES" "NO"))))
