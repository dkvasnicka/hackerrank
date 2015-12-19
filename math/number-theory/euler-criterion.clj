(dotimes [n (Integer/parseInt (read-line))]
  (let [[a p] (map #(java.math.BigInteger. %) 
                    (clojure.string/split (read-line) #" "))]
    (println
      (if (or (zero? a) 
              (= (biginteger 1) 
                 (.modPow a 
                          (.divide (.subtract p (biginteger 1)) (biginteger 2)) 
                          p)))
        "YES"
        "NO"))))
