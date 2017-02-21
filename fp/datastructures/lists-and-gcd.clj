(require '[clojure.java.io :as io])

(defn primefactors->map [p]
  (into (sorted-map)
        (map vec 
             (partition 2 
                        (map #(Integer/parseInt %) 
                             (clojure.string/split p #" "))))))

(defn gcdmerge [x y]
  (cons y
    (if (seq? x) x (list x))))

(defn is-factor? [cnt [k v]]
  (and (seq? v) (= cnt (count v))))

(let [[x & nums] (line-seq (io/reader *in*))
      cnt (Integer/parseInt x)]
  (println
    (clojure.string/join " "
      (flatten
        (map (fn [[k v]] [k (apply min v)])
             (filter (partial is-factor? cnt)
                     (apply (partial merge-with gcdmerge)
                            (map primefactors->map
                                 nums))))))))
