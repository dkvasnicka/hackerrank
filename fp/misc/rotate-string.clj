(require '[clojure.java.io :as io])

(defn rotations-seq [s cnt]
  (cons (take cnt s) 
        (lazy-seq (rotations-seq (rest s) cnt))))

(defn rotations [s]
  (let [l (count s)]
    (take l
          (rotations-seq (rest (cycle s)) l))))

(let [words (rest (line-seq (io/reader *in*)))]
  (doseq [w words]
         (println
           (apply str
                  (interpose " "
                             (map (partial reduce str)
                                  (rotations w)))))))
