(defn sherlockAndAnagrams [s]
  )

(def q (Integer/parseInt (clojure.string/trim (read-line))))
(doseq [q-itr (range q)]
    (println (sherlockAndAnagrams (read-line))))
