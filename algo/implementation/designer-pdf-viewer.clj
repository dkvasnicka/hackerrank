(require '[clojure.java.io :as io]
         '[speculative.instrument :as i])

(i/instrument)

(doseq [[hline word] (partition 2 (line-seq (io/reader *in*)))]
  (let [heights (mapv #(Integer/parseInt %) (clojure.string/split hline #" "))
        max-height (apply max (map #(nth heights (- (int %) 97)) word))]
    (println
      (* (count word) max-height))))
