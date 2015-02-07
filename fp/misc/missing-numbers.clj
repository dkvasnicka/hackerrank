(let [len    (read)
      A      (repeatedly len read)
      afreqs (frequencies A)]
  (let [len    (read)
        B      (repeatedly len read)
        bfreqs (frequencies B)]
    (println
      (clojure.string/join " "
         (sort
           (map first
                (filter (fn [[k v]] (< v 0))
                        (merge-with - afreqs bfreqs))))))))
