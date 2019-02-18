(require '[clojure.java.io :as io])

(def _ (read-line))

(doseq [l (line-seq (io/reader *in*))]
  (let [[a b c] (map #(Integer/parseInt %) (clojure.string/split l #" "))
        dist-a (Math/abs (- c a))
        dist-b (Math/abs (- c b))]
    (println
      (cond
        (= dist-a dist-b) "Mouse C"
        (> dist-a dist-b) "Cat B"
        (< dist-a dist-b) "Cat A"))))
